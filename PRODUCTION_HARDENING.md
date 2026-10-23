# FieldVerify production hardening

## Included
- Short-lived access-token service and secure refresh-cookie utilities.
- Health endpoint: `/api/health`.
- Web Push subscription/test endpoints.
- Private local image upload endpoint with MIME and size validation.
- PostgreSQL daily backup service in `docker-compose.prod.yml`.
- `.env.example` with production configuration.
- Service-worker push notification handlers.
- Backup retention controls.

## Before public deployment
1. Put the API behind HTTPS/TLS.
2. Replace every `CHANGE_ME` secret with long random values.
3. Use a managed/private S3-compatible object store for photos in production.
4. Restrict database/network access to the API and backup service.
5. Set `COOKIE_SECURE=true`.
6. Configure VAPID keys for push notifications.
7. Configure an SMTP/SMS provider only if those services are needed.
8. Run migrations before accepting traffic.
9. Test restore from a backup, not only backup creation.
10. Rotate secrets and review audit logs regularly.

SMS/email cannot be made operational without the provider account credentials. The application is structured so providers can be enabled through environment configuration.
