#!/bin/bash

# 1. Setup the postgres database
docker compose up db


# 2. Run the django migrations
python manage.py migrate


# 3. Populate the models with fake data
python manage.py populate_models


# 4. Go to indexes-pos-moving-model
git checkout indexes-pos-moving-model