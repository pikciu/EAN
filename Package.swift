// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "EAN",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
        .watchOS(.v9),
        .tvOS(.v16),
        .macCatalyst(.v13),
        .visionOS(.v1),
    ],
    products: [
        .library(
            name: "EANView",
            targets: ["EANView"]
        ),
        .library(
            name: "EANView/UIKit",
            targets: ["EANViewUIKit"]
        ),
    ],
    targets: [
        .target(
            name: "EAN",
            path: "Sources/Shared"
        ),
        .testTarget(
            name: "EANTests",
            dependencies: ["EAN"]
        ),
        .target(
            name: "EANView",
            dependencies: ["EAN"],
            path: "Sources/SwiftUI"
        ),
        .target(
            name: "EANViewUIKit",
            dependencies: ["EAN"],
            path: "Sources/UIKit"
        ),
    ]
)
