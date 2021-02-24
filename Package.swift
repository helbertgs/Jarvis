// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Jarvis",
    platforms: [
        .iOS(.v14),
        .macOS(.v10_15),
        .tvOS(.v14)
    ],
    products: [
        .library(
            name: "Jarvis",
            targets: ["Jarvis"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Quick.git", .branch("master")),
        .package(url: "https://github.com/Quick/Nimble", .branch("master"))
    ],
    targets: [
        .target(
            name: "Jarvis",
            dependencies: [],
            path: "Sources"),
        .testTarget(
            name: "JarvisTests",
            dependencies: ["Jarvis", "Nimble", "Quick"],
            path: "Tests")
    ]
)
