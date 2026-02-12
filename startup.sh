#!/bin/bash

# Startup script for Azure App Service

# Change to app directory
cd /home/site/wwwroot

# Set Python path to include project root  
export PYTHONPATH=/home/site/wwwroot:$PYTHONPATH

# Ensure pip is up to date
python -m pip install --upgrade pip

# Install dependencies
pip install -r requirements.txt

# Collect static files (ignore errors if any)
python manage.py collectstatic --noinput 2>/dev/null || true

# Run migrations (ignore errors if any) 
python manage.py migrate --noinput 2>/dev/null || true

echo "Starting gunicorn..."

# Start gunicorn with proper error handling
exec gunicorn azure_project.wsgi:application --workers 4 --threads 2 --worker-class sync --bind 0.0.0.0:8000 --timeout 60
