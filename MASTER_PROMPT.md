# MASTER BUILD PROMPT — FIELDVERIFY

Build and maintain FieldVerify as a real production-oriented offline-first field verification and appliance delivery management system.

## Users and roles

- Admin
- Manager/Supervisor
- Sales Agent
- Field Officer/Installer

Never trust role values supplied by the client. Enforce authorization on the server.

## Sales Agent workflow

Capture:
- sales agent name
- SA ID
- phone
- shop name
- shop location
- date
- appliance purchased
- customer name
- customer phone/number
- customer location
- delivery mode: pickup/delivery

## Field Officer workflow

For an assigned purchase:
- view customer and appliance information
- call customer
- WhatsApp customer
- open customer location
- capture GPS if permitted
- enter manual location reference
- paste Google Maps link
- upload appliance purchase receipt photo
- upload exterior house photos
- upload customer + field officer/installer group photo
- complete verification checklist
- submit verification

## Supervisor workflow

- review submitted verifications
- approve
- reject with reason
- return for correction
- see audit history

## Required system capabilities

- sign up/sign in
- secure password hashing
- JWT authentication
- RBAC
- audit logging
- customer management
- shops
- appliances
- purchases
- assignments
- verifications
- photos
- receipts
- reminders
- communications
- delivery records
- dashboard/reporting
- search/filter
- offline IndexedDB
- sync queue
- PWA installability
- backup strategy
- PostgreSQL migrations

## Security requirements

- validate all request bodies server-side
- parameterized SQL
- bcrypt password hashing
- secure HTTP headers
- rate limiting on authentication endpoints
- do not allow public admin creation after initial setup
- verify ownership/role before modifying records
- audit sensitive changes
- never trust offline data blindly; validate again at sync time
- enforce database constraints for important state and financial/operational integrity


## Additional production features now required

- PDF receipts
- delivery completion records
- user administration
- audit activity review
- IndexedDB offline write queue
- automatic reconnect synchronization
- offline receipt sharing fallback
