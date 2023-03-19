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

# 4. Access the postgres shell and create the following trigger
```sql
CREATE OR REPLACE FUNCTION core_category_name_uppercase()
RETURNS TRIGGER AS $$
BEGIN
    NEW.name = UPPER(NEW.name);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER core_category_name_uppercase
BEFORE INSERT OR UPDATE ON core_category
FOR EACH ROW EXECUTE PROCEDURE core_category_name_uppercase();
```

# 5. Go to branch triggers-pos-moving-model
```bash
git checkout triggers-pos-moving-model
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

```bash
python manage.py shell

from categories.models import Category

Category.objects.create(name='lowercase')

c = Category.objects.last()
assert c.name == 'LOWERCASE', 'The name should be "LOWERCASE"'
```