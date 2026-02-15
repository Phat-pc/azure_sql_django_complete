#!/bin/bash
set -e

export PYTHONPATH=/home/site/wwwroot:$PYTHONPATH
export DJANGO_SETTINGS_MODULE=azure_project.settings
cd /home/site/wwwroot
pip install -r requirements.txt
python manage.py migrate --noinput
gunicorn azure_project.wsgi --workers 4 --threads 2 --worker-class sync --bind 0.0.0.0:8000
