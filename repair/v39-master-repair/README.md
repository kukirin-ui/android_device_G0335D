# G0335D v39 repair branch

Log-grounded triage and the first confirmed defensive patch for the v39 boot failure.

- MASTER_FIX.md: findings, evidence, cautions and test plan.
- patches/frameworks_base/0001-Zygote-filter-invalid-supplementary-gids.patch: negative GID filter for the fatal setgroups(EINVAL) path.
- diagnostics/scan_logs.sh: signature scanner for new captures.

This branch is not a ROM build and is not boot-tested. Secondary subsystem fixes are deliberately not guessed.