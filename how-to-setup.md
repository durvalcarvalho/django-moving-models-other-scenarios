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
CREATE INDEX core_category_name_idx ON core_category (name);
```

# 5. Go to branch indexes-pos-moving-model
```bash
git checkout indexes-pos-moving-model
```
