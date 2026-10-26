// swift-tools-version: 6.0
// Licensed under GPL-3.0. See LICENSE.
//
// VeilKit: VEIL-only code, kept out of Nook's files so upstream releases merge cleanly.

import PackageDescription

let package = Package(
    name: "VeilKit",
    platforms: [.macOS("15.5")],
    products: [
        .library(name: "VeilKit", targets: ["VeilKit"]),
    ],
    targets: [
        .target(
            name: "VeilKit",
            swiftSettings: [.swiftLanguageMode(.v5)]
        ),
    ]
)
