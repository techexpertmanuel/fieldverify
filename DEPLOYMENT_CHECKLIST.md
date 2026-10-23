# Deployment checklist

## Before real users
- Set a strong random `JWT_SECRET`.
- Set `CORS_ORIGIN` to the actual HTTPS frontend/API origin.
- Put the API behind HTTPS.
- Configure PostgreSQL backups.
- Move uploads to private object storage for a larger deployment.
- Configure server monitoring/log collection.
- Test account approval and role restrictions.
- Test backup restore.
- Test offline entry, reconnect, sync and duplicate submissions.
- Review local browser storage/security for the phones used in the field.

## Recommended next production upgrades
- HttpOnly refresh-token cookies instead of long-lived browser storage.
- Virus scanning for uploaded files.
- Object storage with signed URLs.
- Automated database migrations with a migration table.
- Push notifications for reminders.
- PDF receipt generation and server-side email/SMS integration.
- Fine-grained permissions and per-shop data isolation.
