// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWEither",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "WWEither", targets: ["WWEither"]),
    ],
    targets: [
        .target(name: "WWEither", resources: [.copy("Privacy")]),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
