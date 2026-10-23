# FieldVerify — Real Offline-First Full-Stack Management System

This is the real application codebase, not a demo UI.

## What is included

- PWA/mobile-first frontend using HTML/CSS/JavaScript
- Offline storage with IndexedDB
- Offline action queue and background sync when connectivity returns
- Node.js + TypeScript + Express backend
- PostgreSQL database schema and migrations
- Password hashing with bcryptjs
- JWT authentication
- Role-based access control: admin, manager, sales_agent, field_officer
- Customer, shop, purchase and verification management
- Verification assignments
- Manual location codes and Google Maps links
- GPS capture when the phone grants permission
- Receipt photo uploads
- House exterior and customer+officer group photos
- Call and WhatsApp quick actions
- Delivery mode: pickup or delivery
- Supervisor approval/rejection workflow
- Reminders and communication logs
- Audit logs
- Dashboard and reporting endpoints
- Receipt HTML/print/share workflow
- Docker Compose for PostgreSQL
- Environment configuration and production-oriented security headers

## Important architecture note

The phone can work offline because the frontend is a PWA and stores working data locally in IndexedDB.

Multi-user synchronization requires the Node/PostgreSQL backend to be reachable. The app queues offline changes and attempts synchronization when the connection returns.

## Start locally

1. Install Node.js 20+ and Docker.
2. Copy `.env.example` to `.env`.
3. Run:

```bash
docker compose up -d postgres
npm install
npm run install:all
npm run db:migrate
npm run dev
```

Open `http://localhost:4000`.

The backend serves the frontend in development/production mode.

## First account

If the database has no users, the first successful signup may create an administrator account. After that, public signup cannot create an administrator. New accounts should be approved/assigned by an administrator or manager.

## Production

Use HTTPS, a managed PostgreSQL database, private object/file storage, backups, a real domain, strong JWT secrets, restricted CORS, and a reverse proxy. Do not expose PostgreSQL directly to the public internet.

## Main folders

- `frontend/` — mobile PWA
- `backend/src/` — API
- `backend/sql/` — database schema/migrations
- `uploads/` — local uploaded files created at runtime
- `docker-compose.yml` — PostgreSQL for local/self-hosted use


## v2 completed features

- Offline write queue stored in IndexedDB.
- Automatic retry of queued JSON changes when connectivity returns.
- Admin/Manager user management screen.
- Account activation/disable and role changes.
- Audit activity screen.
- Server-generated PDF receipts.
- Offline receipt sharing fallback using phone share.
- Delivery completion endpoint and UI.
- Improved PWA cache strategy.
- Authentication throttling and server validation remain enabled.
