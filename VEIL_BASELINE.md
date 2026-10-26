# VEIL performance baseline

Each milestone adds a column. M0 is Nook 1.3.0 rebranded, with no behavior changes.

**Machine:** MacBook Pro M5, 16 GB, macOS 27, Xcode 27.0. **Build:** Debug, arm64, signed (team 4KNG59VZZQ),
coverage off. **Window:** 1512 × 949 pt. **Pages:** local test pages served from `127.0.0.1:8765` (no network).
Timings from a 60 Hz screen recording are ±17 ms.

| Metric | How measured | M0 |
|---|---|---|
| Full clean build | `xcodebuild … build`, `/usr/bin/time -l` | 91 s wall, 1.03 GB peak RSS |
| First launch (fresh data folder) | `open -g` → first on-screen window ≥ 600 pt | 4.3 s (one-time blocker setup) |
| Warm launch | same, 3 runs | 0.52 / 0.46 / 0.47 s |
| Memory, 1 tab idle | `proc_pid_rusage` phys_footprint, VEIL + its WebKit processes | 170 MB (app 64, WebContent 79) |
| Memory, 30 tabs | same, after 60 s | 774 MB (app 114, 30 × WebContent 576) |
| Tab switch (click) | frames of visible change | 1 frame: no transition animation |
| Command palette open / close (⌘T / Esc) | same | 1 frame each |
| Sidebar hide / show (⌘S) | same | ≈100 ms / ≈70 ms |
| Space switch | — | Not measured in M0: synthetic typing did not reach the New Space dialog's name field. Measure in M4 |
| Input-to-paint latency | — | Not measured: needs an event-timestamped capture harness (Nook ships `docs/perf/launch_probe.py` locally; M2 task) |

## Geometry after M2 (measured on the running app, 2× capture)

| Item | M0 | M2 | Dia (audit) |
|---|---|---|---|
| Frame around the card (top / side / bottom) | 8 / 8 / 8 | **6 / 6 / 6** | 6 / 6 / 6 |
| Top bar | off by default; 39 + 1 hairline | **on by default**; 39 + 1 | 41 + 1 |
| Address pill on hover | 40 (full bar) | **30** | 30 |
| Tab row / pitch | 32 / 34 | **34 / 36** | 34 / 37 |
| Sidebar default / min / max | 250 / 206 / 520 | 250 / 206 / **440** | 245 / 190 / 480 |
| Drag past min | clamps | **hides the sidebar** | hides the sidebar |
| Favorites 1 / 2 / 3 / 4 / 5 / 6 | up to 4 a row | **1 / 2 / 3 / 4 / 5 a row; 6 → 3 × 2** | same |
| Folder child indent | 20 | **16** | 16 |
| Sidebar tint, dark (top → bottom) | accent 55% → window bg | **orange preset #47332c → #4b3e39** | #47312b → #4b3d39 (orange profile) |
| Sidebar tint, light | same | **orange preset #edd3c9 → #f2ddd6** | #eed2c9 → #f2dcd5 |

## Geometry read from the running app (M0)

| Item | Value |
|---|---|
| Tab row | 32 pt tall, 34 pt pitch (`Size.row` 32 + `rowGap` 2) |
| Sidebar | 250 pt default, 206–520 drag range, no drag-to-collapse |
| Web content card | 8 pt inset (sides without sidebar, bottom), `Radius.md` 8 |
| Top bar | 40 pt, **off by default** (`topBarAddressView`), page-colored when on |
| Command palette | centered overlay, 765 pt wide, `Radius.xxl` 24, rows: search, URL, open tab, history only |
