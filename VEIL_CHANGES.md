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
| `Nook/Components/Sidebar/PinnedButtons/PinnedGrid.swift` | Columns: fewest rows that fit (≤5 tiles a row, none under 40pt), tiles spread evenly over them (6 → 3×2); the "Drag to add Favorites" box only shows while dragging (body split into two helpers) | Dia's favorites grid resizes with the count; no empty box | M2 |
| `Packages/NookDesign/Sources/NookDesign/NookDesign.swift` | `containerGradient` is Dia's window color: the accent's hue at a fixed brightness (dark 0.28 → 0.295, light 0.93 → 0.95) with a fraction of its saturation (dark 53% → 33%, light 21% → 16.5%), so it reads as one solid tint; inactive windows keep 60%. `unloadedOpacity` 0.55 → 1; macOS `folderIndent` 20 → 16 | Dia's window tint (opaque, accent-saturated top fading lighter and greyer); Dia doesn't dim unloaded tabs; Dia's 16pt child indent | M2 |
| `Packages/NookUI/Sources/NookUI/Rows/SpaceTab.swift` | Tab title font `bodyRegular` (Nook: `body`, medium) | Dia's regular-weight titles | M2 |
| `Packages/NookDesign/Sources/NookDesign/View+Surface.swift` | `nookRowSelection`: selected fill gets a soft shadow and a 0.5pt edge | Dia's raised selected tab | M2 |
| `Packages/NookUI/Sources/NookUI/Rows/ItemFavicon.swift`, `Packages/NookWeb/Sources/NookWeb/PageSession.swift` | Missing favicon shows `app.fill` in `.quaternary` (was the globe in `.tertiary`) | Dia's grey square placeholder | M2 |
| `Packages/NookUI/Sources/NookUI/Rows/SpaceSeparator.swift` | Separator line shows only on hover (still ripples during a run) | Dia has no resting divider | M2 |
| `Packages/NookUI/Sources/NookUI/Rows/TabFolderView.swift` | Folder row: muted `folder.fill`, small chevron after the title (was before the icon), no item count | Dia's group row | M2 |
| `Nook/Components/Sidebar/TopBar/TopBarView.swift` | `http://` shown dimmed before the host on plain-HTTP pages (`#if VEIL_BUILD`) | Dia's insecure-scheme hint | M2 |
| `Navigation/Sidebar/SpacesSideBarView.swift` | Sidebar background menu follows Dia's order (New Tab, Reopen, New Folder, New Live Folder, New Space, New Profile, Hide Sidebar, Position, Close All Tabs) under `VEIL_BUILD`; Nook's kept as `nookSidebarContextMenu`. Downloads button in the header row while recent downloads exist. `showProfileCreationDialog()` makes a space with its own profile | Dia's right-click menu and header downloads button; Nook's New Profile item was a no-op | M2 |
| `Navigation/Sidebar/SidebarBottomBar.swift` | `onNewProfileTap` callback wired to "New Profile" (was a TODO); under `VEIL_BUILD` the menu label is `chevron.down` and the left button is History only (`clock.arrow.circlepath`, no downloads hover card, indicator or fly-in target) | New Profile works; Dia's footer chevron; downloads live in the header | M2 |
| `App/Window/WindowView.swift` | Under `VEIL_BUILD` the window draws its own space's accent (`windowAccent`) instead of the shared manager's, and sets `\.nookSelectionFill` to the card tint | A window that was not active when its space loaded kept Nook's default teal; Dia's selected tab is the card color | M2 |
| `Packages/NookDesign/Sources/NookDesign/NookDesign.swift` | Shared `themeTint`; new `card`, `cardColor`, `titleTint`, `tileFill`/`tileFillHover`/`tileEdge`, `selectionEdge`/`selectionGlow`, `restingTitleOpacity`; `essentialsTile` 44 → 40 | Dia's tinted surfaces (measured: card #2c221e / #fbf2ef, tiles 10% white / 6% black, title #f5cfc0 / #79361d), 40pt tiles | M2 |
| `Packages/NookDesign/Sources/NookDesign/View+Surface.swift` | `nookRowSelection` is a modifier that reads `\.nookSelectionFill` (nil keeps `Surface.raised`); light 0.5pt edge and a soft halo | Dia's selected tab | M2 |
| `Packages/NookUI/Sources/NookUI/Rows/PinnedTabView.swift` | Tiles use `tileFill`/`tileFillHover` and a 0.5pt `tileEdge` | Dia's favorite tiles | M2 |
| `Packages/NookUI/Sources/NookUI/EmptyWebsiteView.swift` | Background is `Surface.card` instead of the window gradient | Dia's empty page is the card tint | M2 |
| `Packages/NookUI/Sources/NookUI/Rows/SpaceTab.swift` | Unselected titles at `restingTitleOpacity` (0.9) | Dia draws only the selected title at full strength | M2 |
| `Nook/Components/Sidebar/TopBar/TopBarView.swift` | With no page color yet, the top bar falls back to the card tint (`#if VEIL_BUILD`) | Dia's top bar never shows a neutral grey | M2 |
| `Nook/Components/Sidebar/SpaceSection/SpaceSwitcherTitle.swift` | Space name in `titleTint` of its accent (`#if VEIL_BUILD`) | Dia tints the space name | M2 |
| `Nook/Components/Sidebar/SpaceSection/SpaceView.swift` | Under `VEIL_BUILD` the separator shows only when there are pinned tabs, and New Tab sits `rowGap` above the tabs | Dia: no divider under favorites, New Tab spaced like a tab row | M2 |
| `Navigation/Sidebar/SpacesSideBarView.swift` | Under `VEIL_BUILD`: empty `SidebarHeader` left out with the top bar on; content starts at 54pt; space pages ignore the top safe area; 6pt under the favorites; header Downloads button is the download fly-in target; the History button opens the History tab | Dia's sidebar geometry (favorites at 54pt, New Tab at about 101pt) | M2 |

## Known Nook identity left in place (by design)

- Logger subsystems and queue labels `com.gstudios.nook` (`SidebarPiPPanel`, `DevPick`, `TabStore`, `DevMCPServer`): internal only, so they stay to keep those files merge-clean. Stream VEIL logs with both subsystems, or by process name `VEIL`.
- `LegacyDataMigration` copies data from two old Nook bundle IDs on first launch. Neither exists on this Mac, so it does nothing.
- Visible "Nook" left on purpose: the AI chat ("Ask Nook", hidden), update and what's-new cards (updater off), DevMCP agent instructions (developer-only), and on-disk names (`Application Support/Nook/…`, `Nook MCP` downloads folder, pasteboard type, script markers).
- The ⇧⌘A and ⌥⇧⌘O key bindings are still registered with the shortcut manager, so those keys are swallowed but do nothing.
- Developer Mode's local control server and its Agent Space stay available (off by default): they let a coding agent drive VEIL.
- The iOS target (`NookiOS`) keeps Nook's identity; VEIL does not build it.
