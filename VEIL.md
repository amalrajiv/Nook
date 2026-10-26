# VEIL rules (read before Nook's CLAUDE.md)

VEIL is a personal fork of [Nook](https://github.com/nook-browser/Nook), rebased onto Nook's release tags.
The plan lives outside this repo: `~/Veil/research/veil-plan-nook.md` (spec, milestones, token targets).
Nook's `CLAUDE.md` still applies in full; these rules come first where they differ.

1. **Branches.** `veil/main` is VEIL's trunk, started from Nook's `v1.3.0` tag. Upstream releases are merged
   from `upstream` tags (`git fetch upstream --tags`), never from Nook's `develop`. Work happens on
   `veil/<milestone>-<name>` branches merged into `veil/main`.
2. **Touch as few upstream files as possible.** Every upstream file VEIL edits is listed in
   `VEIL_CHANGES.md` with a one-line reason. New VEIL code goes in `Packages/VeilKit` whenever it can.
   Fewer touched files means painless monthly merges.
3. **One flag for VEIL-only behavior.** The app target compiles with `VEIL_BUILD`
   (`SWIFT_ACTIVE_COMPILATION_CONDITIONS`). Turn upstream features off with `#if VEIL_BUILD` /
   `#if !VEIL_BUILD` at their entry points; do not delete upstream code, so its changes keep merging.
4. **Identity.** Bundle ID `com.amalrajiv.veil`, product name `VEIL`, display name `VEIL`, Swift module
   name kept as `Nook` (`PRODUCT_MODULE_NAME`) so upstream code and `@testable` imports keep compiling.
   Data lives in `~/Library/Application Support/com.amalrajiv.veil/`, separate from any Nook install.
5. **No updates from Nook's feed.** Sparkle's feed and Nook's EdDSA key are removed and the updater never
   starts in `VEIL_BUILD`. A Nook release signed with Nook's key must never be able to replace VEIL.
6. **Visible text.** Nook's rule stands: no added, reworded or removed user-facing text without the
   owner's approval. Approved so far: the app name "VEIL" where the app names itself.
7. **Signing.** Team `4KNG59VZZQ` (Amal Rajiv), automatic signing, reduced `Nook/Nook-CI.entitlements`
   (no push, no autofill provider).
8. **Measure.** Each milestone records the performance numbers in `VEIL_BASELINE.md` next to M0's.
