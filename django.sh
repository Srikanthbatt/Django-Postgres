#!/bin/bash
echo "Create migrations"
python3 manage.py makemigrations djangoapp
echo "=================================="

echo "Migrate"
python3 manage.py migrate
echo "=================================="

echo "Create Superuser"
DJANGO_SUPERUSER_USERNAME="admin" \
DJANGO_SUPERUSER_PASSWORD="" \
DJANGO_SUPERUSER_EMAIL="email@kanis.hk" \
python3 manage.py createsuperuser --noinput
echo "=================================="

echo "Start server"
python3 manage.py runserver 0.0.0.0:8000
