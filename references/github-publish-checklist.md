# GitHub Publish Checklist

## TOC
- Pre-publish
- Security and Secrets
- CI and Quality Gates
- Release Notes

## Pre-publish
- Ensure `README.md` explains setup, scripts, and architecture.
- Confirm `.env.example` is complete and secret-free.
- Verify install + run from clean clone.

## Security and Secrets
- Rotate and remove any leaked or test secrets.
- Check `.gitignore` for `.env`, generated clients, and local DB artifacts.
- Ensure better-auth keys/secrets are environment-driven only.

## CI and Quality Gates
- Run `npm ci` (or repo package manager equivalent).
- Run `npm run lint`.
- Run `npm run typecheck`.
- Run `npm run build`.
- Run tests if project has them.

## Release Notes
- Summarize API contract changes (tRPC procedures/inputs/outputs).
- Summarize schema changes (new models, relations, indexes, migrations).
- Summarize auth behavior changes (login flow, protected routes, roles).
