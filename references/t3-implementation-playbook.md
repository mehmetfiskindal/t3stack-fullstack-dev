# T3 Implementation Playbook

## TOC
- Project Structure
- Feature Slice Pattern
- Auth and Procedure Matrix
- Prisma Change Flow
- tRPC Contract Pattern
- UI Delivery Pattern

## Project Structure
- `src/server/auth/*`: better-auth setup and server session helpers.
- `src/server/db/*`: Prisma client and DB helpers.
- `src/server/api/routers/*`: domain routers and procedures.
- `src/app/*` or `src/pages/*`: route handlers and views.
- `src/components/*`: reusable UI blocks.

## Feature Slice Pattern
1. Define data changes in Prisma schema.
2. Add/extend Zod input schema near the router.
3. Implement tRPC procedure with auth and DB operations.
4. Consume procedure with typed hooks/client calls.
5. Render UI states: loading, error, empty, success.

## Auth and Procedure Matrix
- Public read: `publicProcedure` + safe/limited fields.
- User scoped read/write: `protectedProcedure` + `session.user.id` filter.
- Admin actions: dedicated middleware/guard + audit logging.

## Prisma Change Flow
1. Edit `schema.prisma`.
2. Run local sync (`db:push`) for quick iteration.
3. Generate and review migration for shared environments.
4. Re-check query performance with indexes after relation-heavy changes.

## tRPC Contract Pattern
- Input: `z.object({...})`
- Authorization: procedure-level middleware.
- Data access: narrow select/include.
- Output: explicit object shape or inferred return type.
- Errors: throw typed TRPC errors with stable codes.

## UI Delivery Pattern
- Keep server/client boundary explicit.
- Use optimistic updates only when rollback logic exists.
- Use Tailwind utility groups; extract repeated blocks to components.
- Preserve accessibility (`aria-*`, semantic controls, keyboard flow).
