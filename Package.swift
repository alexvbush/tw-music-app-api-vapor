// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "tw-music-app-api-vapor",
    products: [
        .library(name: "App", targets: ["App"]),
        .executable(name: "Run", targets: ["Run"])
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", .upToNextMinor(from: "2.2.0")),
        .package(url: "https://github.com/vapor/fluent-provider.git", .upToNextMinor(from: "1.2.0")),
    ],
    targets: [
        .target(name: "App", dependencies: ["Vapor", "FluentProvider"],
                exclude: [
                    "Config",
                    "Database",
                    "Localization",
                    "Public",
                    "Resources",
                    ]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App", "Testing"])
    ]
)
