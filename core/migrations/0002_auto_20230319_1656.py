# Generated by Django 5.0.dev20230318231546 on 2023-03-19 16:56

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0001_initial'),
    ]

    operations = [
        migrations.SeparateDatabaseAndState(
            database_operations=[
                migrations.AlterModelTable(
                    name='category',
                    table='categories_category',
                ),
            ],
        ),
    ]
