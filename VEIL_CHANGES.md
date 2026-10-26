# Upstream files VEIL changes

Every Nook file VEIL edits, with why. When an upstream merge conflicts, this list says what VEIL meant.
New VEIL-only files (`VEIL.md`, `VEIL_CHANGES.md`, `VEIL_BASELINE.md`, `Packages/VeilKit/`,
`Nook/veil.icon/`) are not listed: they cannot conflict.

| File | Change | Why | Milestone |
|---|---|---|---|
| `Nook.xcodeproj/project.pbxproj` | macOS app target, Debug and Release only: bundle ID `com.amalrajiv.veil`, `PRODUCT_NAME = VEIL`, `PRODUCT_MODULE_NAME = Nook`, display name VEIL, app icon `veil`, team `4KNG59VZZQ`, entitlements `Nook/Nook-CI.entitlements`, `SWIFT_ACTIVE_COMPILATION_CONDITIONS` adds `VEIL_BUILD`. iOS target untouched | Identity, local signing, VEIL flag | M0 |
| `Nook/Info.plist` | Removed `SUFeedURL` and `SUPublicEDKey`; Sparkle automatic checks, updates and installs set to false | Nook's signed updates must never replace VEIL | M0 |
| `App/AppDelegate.swift` | `updaterController` starts with `startingUpdater: false` under `VEIL_BUILD` | Same | M0 |
| `App/NookCommands.swift` | "Check for Updates..." hidden under `VEIL_BUILD`; "Make Nook Default Browser" → "Make VEIL Default Browser" | No Nook updater; app name (approved rebrand) | M0 |
| `Nook/Assets.xcassets/nook-logo-1024.imageset/nook-logo-1024.png` | Image replaced with the VEIL logo (asset name kept) | Nook's trademark policy: own icon; keeps the three call sites untouched | M0 |
| `CLAUDE.md` | One line under the title pointing to `VEIL.md` (`@VEIL.md` import) | Agents read VEIL's rules first | M0 |

## Known Nook identity left in place (by design)

- Logger subsystems and queue labels `com.gstudios.nook` (`SidebarPiPPanel`, `DevPick`, `TabStore`, `DevMCPServer`): internal only, so they stay to keep those files merge-clean. Stream VEIL logs with both subsystems, or by process name `VEIL`.
- `LegacyDataMigration` copies data from two old Nook bundle IDs on first launch. Neither exists on this Mac, so it does nothing.
- About 30 visible "Nook" strings (onboarding, settings, extension prompts, DevMCP text). Renaming them is M1, after the wording is approved.
- The iOS target (`NookiOS`) keeps Nook's identity; VEIL does not build it.
