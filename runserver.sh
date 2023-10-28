#!/bin/sh

# python manage.py collectstatic --no-input
python manage.py migrate
gunicorn site1.wsgi --bind=0.0.0.0:8002

