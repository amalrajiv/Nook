# Upstream files VEIL changes

Every Nook file VEIL edits, with why. When an upstream merge conflicts, this list says what VEIL meant.
New VEIL-only files (`VEIL.md`, `VEIL_CHANGES.md`, `VEIL_BASELINE.md`, `Packages/VeilKit/`,
`Nook/veil.icon/`, `Nook/Veil/`) are not listed: they cannot conflict.

| File | Change | Why | Milestone |
|---|---|---|---|
| `Nook.xcodeproj/project.pbxproj` | macOS app target, Debug and Release only: bundle ID `com.amalrajiv.veil`, `PRODUCT_NAME = VEIL`, `PRODUCT_MODULE_NAME = Nook`, display name VEIL, app icon `veil`, team `4KNG59VZZQ`, entitlements `Nook/Nook-CI.entitlements`, `SWIFT_ACTIVE_COMPILATION_CONDITIONS` adds `VEIL_BUILD`. iOS target untouched | Identity, local signing, VEIL flag | M0 |
| `Nook/Info.plist` | Removed `SUFeedURL` and `SUPublicEDKey`; Sparkle automatic checks, updates and installs set to false | Nook's signed updates must never replace VEIL | M0 |
| `App/AppDelegate.swift` | `updaterController` starts with `startingUpdater: false` under `VEIL_BUILD` | Same | M0 |
| `App/NookCommands.swift` | "Check for Updates..." hidden under `VEIL_BUILD`; "Make Nook Default Browser" → "Make VEIL Default Browser" | No Nook updater; app name (approved rebrand) | M0 |
| `Nook/Assets.xcassets/nook-logo-1024.imageset/nook-logo-1024.png` | Image replaced with the VEIL logo (asset name kept) | Nook's trademark policy: own icon; keeps the three call sites untouched | M0 |
| `CLAUDE.md` | One line under the title pointing to `VEIL.md` (`@VEIL.md` import) | Agents read VEIL's rules first | M0 |
| `App/NookApp.swift` | Calls `VeilPolicy.apply(to:)` right after settings are created | AI off at every launch; DuckDuckGo default once | M1 |
| `App/NookCommands.swift` | "Toggle AI Assistant" and "Organize Tabs" hidden under `VEIL_BUILD`; "Quit Nook" → "Quit VEIL" | No AI | M1 |
| `App/Window/WindowView.swift` | Organize-tabs notification ignored under `VEIL_BUILD` | No AI from the shortcut | M1 |
| `Nook/Components/Settings/SettingsUtils.swift` | Settings sidebar filters `VeilPolicy.hiddenSettingsTabs` (the AI tab); "Ad Blocker" tab → "Veil Guard" | No AI; Veil Guard name | M1 |
| `Nook/Components/Settings/Tabs/Shortcuts.swift` | Hides `VeilPolicy.hiddenShortcutActions`; "twice for Nook" → VEIL | No AI | M1 |
| `Nook/Components/Extensions/ExtensionLibraryView.swift` | Site panel row "Content Blocker" → "Veil Guard" | Veil Guard name | M1 |
| `Nook/Components/WebsiteView/BlockedPageView.swift` | "Nook blocked this page" / "the ad blocker's filter lists" → Veil Guard | Veil Guard name | M1 |
| `Packages/NookUI/Sources/NookUI/Settings/General.swift` | "Warn before quitting VEIL"; "Automatically update Nook" hidden when the bundle ID is VEIL's (packages don't see `VEIL_BUILD`) | App name; VEIL has no updater | M1 |
| App-name text only (one string each): `Nook/Managers/DialogManager/DialogManager.swift`, `.../Dialogs/SettingsDialog.swift`, `AuthenticationManager.swift`, `BrowserManager.swift` (window titles), `Nook/Browser/TabsController+macOS.swift`, `Settings/Tabs/Developer.swift` (also the token path), `ExtensionPermissionView.swift`, `ExtensionLibraryMoreMenu.swift`, `Onboarding/Stages/HelloStage.swift`, `ImportStage.swift` | "Nook" → "VEIL" where the app names itself | Approved rebrand | M1 |
| `App/Window/WindowView.swift` | Side and bottom content insets use `VeilDesign.contentFrame` (6 in VEIL, 8 in Nook) | Dia's 6pt frame | M2 |
| `Nook/Components/WebsiteView/WebsiteLoadingIndicator.swift` | Band height uses `VeilDesign.contentFrame` (it is the frame above the card) | Dia's 6pt top frame | M2 |
| `Nook/Components/Sidebar/SidebarResizeView.swift` | Max width `VeilDesign.sidebarMax` (440); dragging below `sidebarCollapseWidth` (100) hides the sidebar | Dia's resize and drag-to-collapse | M2 |
| `Nook/Components/Sidebar/TopBar/TopBarView.swift` | Address pill vertical padding `VeilDesign.addressPillVerticalPadding` (1 in VEIL, 6 in Nook) | Dia's 30pt hover pill | M2 |
| `Packages/NookDesign/Sources/NookDesign/NookDesign.swift` | macOS `Size.row` 32 → 34 (one line; packages don't see `VEIL_BUILD`) | Dia's 34pt tab rows; drag hit-testing reads the same token | M2 |
| `Navigation/Sidebar/SpacesSideBarView.swift` | With the top bar on, the space name sits in the traffic-light row (`#if VEIL_BUILD`) | Dia's one-row sidebar header | M2 |
| `Navigation/Sidebar/SidebarHeader.swift` | With the top bar on, the second header row (sidebar toggle + space name) is not shown | Same | M2 |
| `Nook/Components/Sidebar/TopBar/TopBarView.swift` | Sidebar toggle button before Back (`#if VEIL_BUILD`) | Dia keeps it in the top bar | M2 |
| `Nook/Components/Sidebar/PinnedButtons/PinnedGrid.swift` | Always four columns; the "Drag to add Favorites" box only shows while dragging (body split into two helpers) | Dia's fixed-size tiles, no empty box | M2 |
| `Packages/NookDesign/Sources/NookDesign/NookDesign.swift` | `containerGradient` blends 0.72 → 0.70 toward the window background (Nook: 0.55 → plain background); `unloadedOpacity` 0.55 → 1 | Dia's even, darker tint; Dia doesn't dim unloaded tabs | M2 |
| `Packages/NookUI/Sources/NookUI/Rows/SpaceTab.swift` | Tab title font `bodyRegular` (Nook: `body`, medium) | Dia's regular-weight titles | M2 |

## Known Nook identity left in place (by design)

- Logger subsystems and queue labels `com.gstudios.nook` (`SidebarPiPPanel`, `DevPick`, `TabStore`, `DevMCPServer`): internal only, so they stay to keep those files merge-clean. Stream VEIL logs with both subsystems, or by process name `VEIL`.
- `LegacyDataMigration` copies data from two old Nook bundle IDs on first launch. Neither exists on this Mac, so it does nothing.
- Visible "Nook" left on purpose: the AI chat ("Ask Nook", hidden), update and what's-new cards (updater off), DevMCP agent instructions (developer-only), and on-disk names (`Application Support/Nook/…`, `Nook MCP` downloads folder, pasteboard type, script markers).
- The ⇧⌘A and ⌥⇧⌘O key bindings are still registered with the shortcut manager, so those keys are swallowed but do nothing.
- Developer Mode's local control server and its Agent Space stay available (off by default): they let a coding agent drive VEIL.
- The iOS target (`NookiOS`) keeps Nook's identity; VEIL does not build it.
