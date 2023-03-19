import random
from django.core.management.base import BaseCommand

from categories.models import Category
from core.models import Product

from faker import Faker


class Command(BaseCommand):
    QTY = 50000

    def handle(self, *args, **kwargs):
        faker = Faker()

        categories = Category.objects.bulk_create(
            Category(name=faker.word())
            for _ in range(self.QTY)
        )

        self.stdout.write(self.style.SUCCESS(f"Created {self.QTY} categories"))

        Product.objects.bulk_create(
            Product(
                name=faker.word(),
                category=random.choice(categories),
                price=faker.pydecimal(left_digits=5, right_digits=2, positive=True),
                stock=faker.pyint(min_value=0, max_value=1000, step=1)
            )
            for _ in range(self.QTY)
        )

        self.stdout.write(self.style.SUCCESS(
            f"Created {self.QTY} products assigned to random categories")
        )

        self.stdout.write(self.style.SUCCESS("Populate models completed"))
