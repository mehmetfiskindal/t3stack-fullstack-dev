# OWASP Top 10:2025 Security Checklist

## TOC
- A01 Broken Access Control
- A02 Security Misconfiguration
- A03 Software Supply Chain Failures
- A04 Cryptographic Failures
- A05 Injection
- A06 Insecure Design
- A07 Authentication Failures
- A08 Software or Data Integrity Failures
- A09 Security Logging and Alerting Failures
- A10 Mishandling of Exceptional Conditions

## A01 Broken Access Control
- Enforce route/procedure authorization server-side.
- Scope all user data queries by tenant/user ownership.
- Deny by default for unknown roles and missing permissions.

## A02 Security Misconfiguration
- Keep production-safe defaults for headers, CORS, cookies, and cache policies.
- Remove verbose error pages and framework debug outputs in production.
- Keep secrets only in environment variables; do not hardcode.

## A03 Software Supply Chain Failures
- Review lockfile diffs in every PR.
- Run dependency vulnerability scans in CI.
- Restrict third-party packages to maintained and trusted sources.

## A04 Cryptographic Failures
- Use battle-tested libraries and framework defaults.
- Enforce HTTPS/TLS and secure cookie settings.
- Never log secrets, tokens, raw credentials, or private keys.

## A05 Injection
- Validate request input with Zod at tRPC boundaries.
- Use Prisma ORM or parameterized queries only.
- Sanitize or escape untrusted output in UI rendering paths.

## A06 Insecure Design
- Define abuse cases and security acceptance criteria for each feature.
- Include rate limiting and anti-automation controls where relevant.
- Separate high-risk operations into stricter flows (re-auth, extra checks).

## A07 Authentication Failures
- Use better-auth session management with secure cookie flags.
- Protect password reset and verification flows against replay and brute force.
- Invalidate sessions/tokens on critical account changes.

## A08 Software or Data Integrity Failures
- Protect CI/CD with least-privilege credentials and branch protections.
- Verify migration and seed scripts before deployment.
- Reject unsigned or untrusted build/deploy artifacts.

## A09 Security Logging and Alerting Failures
- Log auth failures, permission denials, unusual spikes, and sensitive changes.
- Include enough context for triage without exposing sensitive data.
- Ensure alerts route to an owned channel with response expectations.

## A10 Mishandling of Exceptional Conditions
- Use centralized error handling and safe fallback behavior.
- Avoid exposing stack traces and internals to clients.
- Classify retriable vs non-retriable errors and handle idempotency safely.
