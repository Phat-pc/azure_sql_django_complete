#!/bin/bash
set -e

APP_DIR="$(cd "$(dirname "$0")" && pwd)"

export PYTHONPATH=$APP_DIR:$PYTHONPATH
export DJANGO_SETTINGS_MODULE=azure_project.settings
cd "$APP_DIR"
python manage.py migrate --noinput
exec gunicorn azure_project.wsgi --workers 4 --threads 2 --worker-class sync --bind 0.0.0.0:${PORT:-8000}
