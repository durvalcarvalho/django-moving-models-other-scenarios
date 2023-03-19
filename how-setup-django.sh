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

# 4. Access the postgres shell and create the following index
```sql
docker compose exec db psql -U postgres
CREATE INDEX core_category_name_idx ON core_category (name);
```

# 5. Go to branch indexes-pos-moving-model
```bash
git checkout indexes-pos-moving-model
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
EXPLAIN ANALYZE
SELECT cc.id, cc.name
FROM "categories_category" cc
WHERE UPPER(cc.name::text) LIKE UPPER('a%');
```