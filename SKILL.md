---
name: t3stack-fullstack-dev
description: Develop, debug, and ship T3 Stack applications using Next.js + TypeScript with better-auth, Prisma, tRPC, and Tailwind CSS. Use when implementing new fullstack features, auth/session flows, API procedures, database schema changes, high-quality frontend UI work with Tailwind, bug fixes, refactors, performance work, or GitHub-ready release preparation for this stack.
---

# T3 Fullstack Dev

## Quick Start

1. Detect package manager from lockfiles (`package-lock.json`, `pnpm-lock.yaml`, `yarn.lock`).
2. Run baseline checks before and after edits:
   - `npm run lint`
   - `npm run typecheck`
   - `npm run check`
3. Use `scripts/t3_stack_audit.sh` for fast stack validation when onboarding a repo.

## Implementation Workflow

1. Confirm requirement boundaries: route, API contract, data model, auth constraint, UI state.
2. Start from schema/contracts, then build server logic, then client wiring, then styling.
3. Keep types single-source-of-truth from Prisma schema + tRPC router outputs.
4. Validate affected paths with targeted checks first, then run full `npm run check`.
5. Apply the OWASP Top 10:2025 security gate before finalizing any change.

## OWASP Top 10:2025 Security Gate

- `A01 Broken Access Control`: Enforce authorization in server procedures and DB filters; never rely on client-side checks.
- `A02 Security Misconfiguration`: Keep secure defaults, disable debug exposure, and load all secrets from environment variables.
- `A03 Software Supply Chain Failures`: Pin dependency versions, review lockfile changes, and run dependency audit in CI.
- `A04 Cryptographic Failures`: Use modern algorithms and managed libraries; never create custom crypto implementations.
- `A05 Injection`: Validate all untrusted inputs with Zod and use Prisma parameterized queries/ORM patterns only.
- `A06 Insecure Design`: Add threat-aware acceptance criteria for new features and define misuse cases before implementation.
- `A07 Authentication Failures`: Use better-auth best practices, strict session validation, secure cookie settings, and short-lived tokens where needed.
- `A08 Software or Data Integrity Failures`: Verify build/deploy integrity, protect CI/CD secrets, and require trusted artifact sources.
- `A09 Security Logging and Alerting Failures`: Log security-relevant events with request/user context and create actionable alerts.
- `A10 Mishandling of Exceptional Conditions`: Fail securely on exceptions, return safe error messages, and avoid leaking internal details.

For detailed controls and review checklist, read [references/owasp-2025-security-checklist.md](references/owasp-2025-security-checklist.md).

## better-auth Rules

- Keep auth config in a single server-only module.
- Resolve session on the server for protected data paths.
- Enforce authorization at tRPC procedure boundaries; do not trust client guards alone.
- Expose minimal user/session fields to clients.

## Prisma Rules

- Change `prisma/schema.prisma` first for data model updates.
- Prefer explicit relations, indexes, and unique constraints for query paths.
- Use `db:push` for local iteration and migrations for durable environments.
- Keep query selection narrow (`select`/`include`) to avoid overfetching.

## tRPC Rules

- Keep routers split by domain and merge in a central app router.
- Validate every input with Zod.
- Use protected/public procedures consistently.
- Return typed domain payloads; avoid `any` and ad-hoc casting.

## Tailwind + UI Rules

- Build UI with frontend-developer quality, not only functional layouts.
- Keep utility classes readable; extract repeated patterns to components.
- Prefer design tokens via CSS variables for theme consistency.
- Preserve mobile-first behavior and verify responsive breakpoints.
- Keep loading/error/empty states explicit for async views.
- Use clear visual hierarchy: typography scale, spacing rhythm, and consistent component density.
- Add meaningful interaction polish: hover/focus/active/disabled states and subtle transitions.
- Keep accessibility first: visible focus, sufficient contrast, semantic HTML, keyboard usability.
- Avoid generic boilerplate visuals; keep each screen intentional and cohesive.

For detailed UI standards, read [references/tailwind-ui-quality-guide.md](references/tailwind-ui-quality-guide.md).

## TypeScript Rules

- Keep `strict`-safe code and avoid non-null assertions unless justified.
- Narrow unknown/error values before use.
- Prefer inferred types from source libraries (`Prisma`, `tRPC`, `zod`) over duplicate interfaces.

## GitHub Publishing Workflow

1. Run `npm run check` and `npm run build`.
2. Ensure `.env.example` includes required variables without secrets.
3. Verify migrations and seed strategy are documented in project docs.
4. Confirm CI command parity (`lint`, `typecheck`, `build`).
5. Confirm OWASP Top 10:2025 security gate items are addressed for changed files.
6. Prepare a clear PR description with schema/API/auth impact.

For detailed release checklist, read [references/github-publish-checklist.md](references/github-publish-checklist.md).
For architecture guardrails and patterns, read [references/t3-implementation-playbook.md](references/t3-implementation-playbook.md).
