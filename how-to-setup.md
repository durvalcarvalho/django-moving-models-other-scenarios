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
