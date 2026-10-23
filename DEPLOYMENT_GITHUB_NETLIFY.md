# FieldVerify — GitHub + Netlify Deployment

## Architecture

- GitHub: source code + CI
- Netlify: mobile PWA + Express API through a Netlify Function
- PostgreSQL: managed external database
- Private S3-compatible storage: customer verification photos
- HTTPS: Netlify/custom domain

## 1. GitHub

Create a repository and push this project:

```bash
git init
git add .
git commit -m "FieldVerify production deployment"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/fieldverify.git
git push -u origin main
```

Never commit `.env`, database passwords, JWT secrets, storage keys, or customer photos.

## 2. PostgreSQL

Create a managed PostgreSQL database that supports TLS. Put its connection string in Netlify as `DATABASE_URL`.

Run the project's migrations before production use.

## 3. Netlify

Netlify → Add new project → Import from Git → GitHub → select the repository.

`netlify.toml` already configures:

- Build command: `bash netlify-build.sh`
- Publish directory: `frontend`
- Functions directory: `netlify/functions`
- `/api/*` rewrite to the API function
- SPA fallback to `index.html`

## 4. Environment variables

In Netlify → Project configuration → Environment variables, add the values in `.env.netlify.example`.

Minimum:

```text
NODE_ENV=production
DATABASE_URL=...
JWT_SECRET=...
ACCESS_TOKEN_TTL=15m
REFRESH_TOKEN_DAYS=30
COOKIE_SECURE=true
COOKIE_SAME_SITE=lax
APP_ORIGIN=https://YOUR-SITE.netlify.app
CORS_ORIGINS=https://YOUR-SITE.netlify.app
```

Use the exact HTTPS origin. Update both origin variables if you later add a custom domain.

## 5. Authentication/CORS

The deployment uses:

- HTTPS secure cookies
- credentialed CORS
- explicit allowed origins
- Express `trust proxy` for Netlify's HTTPS proxy

Do not use `*` for CORS in production.

## 6. API routing

The frontend continues calling:

```text
/api/...
```

Netlify rewrites it to:

```text
/.netlify/functions/api/...
```

The Express app is wrapped with `serverless-http`.

## 7. Photos

Do not use Netlify function local disk as permanent storage. Configure private S3-compatible storage and keep the bucket private. Production photo viewing should use short-lived signed URLs.

## 8. Mobile

Open the deployed HTTPS URL on Android and choose **Add to Home screen / Install app**.

The existing PWA/service worker and IndexedDB offline queue support field work with unreliable connectivity.

## 9. Verify

Check:

```text
https://YOUR-SITE.netlify.app/
https://YOUR-SITE.netlify.app/api/health
```

Then test sign-in, customer creation, assignments, photo upload, verification, receipt generation, delivery completion, offline actions and resynchronization.

## 10. Automatic deployment

After connecting Netlify to GitHub, pushes to the configured production branch automatically trigger a Netlify build/deploy.

## 11. Production checklist

- HTTPS enabled
- Strong JWT secret
- PostgreSQL TLS
- Restricted CORS
- Secure cookies
- Private photo storage
- No secrets in GitHub
- Backups tested by restoration
- Admin accounts secured
- Offline sync tested
- Authentication expiry/logout tested

## Important

Netlify should host the frontend and serverless API layer. Keep PostgreSQL, private object storage, SMS/email providers and long-running backup jobs outside Netlify.
