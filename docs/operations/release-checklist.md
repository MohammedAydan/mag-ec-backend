# Release Checklist

- [ ] `pnpm lint`
- [ ] `pnpm typecheck`
- [ ] `pnpm test`
- [ ] `pnpm test:e2e`
- [ ] `pnpm prisma:validate`
- [ ] `pnpm prisma:generate`
- [ ] `pnpm openapi:verify`
- [ ] `pnpm flutter:client:verify`
- [ ] `pnpm security:audit`
- [ ] `pnpm build`
- [ ] Candidate migrations reviewed for release readiness
- [ ] Staging deploy completed
- [ ] Backup and restore path confirmed
- [ ] Production smoke-test plan executed
- [ ] Release notes include contract-impact summary
