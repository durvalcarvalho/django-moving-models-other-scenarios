#!/bin/bash

# 1. Setup the postgres database
```bash
docker compose up db
```

# 2. Run the django migrations
```bash
python manage.py migrate
```

# 3. Populate the models with fake data
```bash
python manage.py populate_models
```

# 4. Access the postgres shell and create the following view
```sql
CREATE OR REPLACE VIEW core_product_category AS
SELECT
    core_product.id,
    core_product.name,
    core_category.name AS category_name
FROM core_product
INNER JOIN core_category ON core_product.category_id = core_category.id;
```

# 5. Go to branch views-pos-moving-model
```bash
git checkout views-pos-moving-model
```

# 6. Run makemigrations command, and confirm model moving
```bash
python manage.py makemigrations
```

# 7. Run the django migrations
```bash
python manage.py migrate
```


# 8. It's not supposed to any error, run some queries to confirm

```sql
SELECT id, name, category_name
FROM public.core_product_category;
```

```python
from core.models import Product
from category.models import Category

c = Category.objects.create(name='foo')
p = Product.objects.create(name='bar', category=c)
```

```sql
SELECT id, name, category_name
FROM public.core_product_category
WHERE name='bar' and category_name='foo';
```