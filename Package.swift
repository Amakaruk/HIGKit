// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "HIGKit",
    platforms: [
        .iOS(.v17),
        .macOS(.v15),
    ],
    products: [
        .library(
            name: "HIGKit",
            targets: ["HIGKit"]
        ),
    ],
    targets: [
        .target(
            name: "HIGKit"
        ),
        .testTarget(
            name: "HIGKitTests",
            dependencies: ["HIGKit"]
        ),
    ]
)
