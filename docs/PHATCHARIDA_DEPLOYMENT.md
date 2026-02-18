# Phatcharida Azure Deployment Guide

## Summary of Changes

Your Django application has been updated for **phatcharida** deployment with the following changes:

### 1. GitHub Remote Updated ✓
- **Repository**: `https://github.com/Phat-pc/azure_sql_django_complete`
- Configured as `origin` remote

### 2. Settings.py Configuration Updated ✓
The settings now support dynamic environment variables for:
- Database selection (SQLite for local, Azure SQL for production)
- ALLOWED_HOSTS configuration
- All database credentials

### 3. Environment Variables Created ✓
- `.env.phatcharida` file created with all credentials

---

## Azure App Service Environment Variables

Set these variables in your **phatcharida-backend** App Service (Configuration > Application settings):

### Required Variables:

```
USE_AZURE_SQL=True
DEBUG=False
ALLOWED_HOSTS=phatcharida-backend.azurewebsites.net,phatcharida-backend,localhost

DB_NAME=phatcharida-db
DB_USER=phatcharida-admin
DB_PASSWORD=Qcallis7!pc
DB_HOST=phatcharida.database.windows.net
DB_PORT=1433

MONGO_URI=mongodb+srv://phatcharida:PASSWORD@phatcharida-mongodb.global.mongocluster.cosmos.azure.com/?tls=true&authMechanism=SCRAM-SHA-256&retrywrites=false&maxIdleTimeMS=120000
MONGO_DB_NAME=django_store_reviews
```

---

## Azure SQL Server Details

| Property | Value |
|----------|-------|
| Server Name | phatcharida.database.windows.net |
| Database | phatcharida-db |
| Admin Login | phatcharida-admin |
| Port | 1433 |
| Driver | ODBC Driver 18 for SQL Server |

---

## Next Steps

1. **Push to GitHub**: `git add .` → `git commit -m "Update for phatcharida deployment"` → `git push origin main`

2. **Configure Azure App Service**: Set all environment variables listed above in Azure Portal

3. **Test Locally** (optional):
   ```powershell
   # Load phatcharida env
   $env:USE_AZURE_SQL='True'
   # (set other variables as needed)
   python manage.py migrate
   ```

4. **Deploy**: Redeploy from GitHub (if CI/CD is configured) or deploy manually

---

## Verification

After deployment, verify the connection:
- Check Azure App Service logs
- Test API endpoints
- Verify database migrations completed

