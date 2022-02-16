// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppSync",
    platforms: [.iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AppSync",
            targets: ["AppSync"])
    ],
    dependencies: [
        .package(name: "Amplify", url: "https://github.com/aws-amplify/amplify-ios", .upToNextMajor(from: "1.19.2")),
    ],
    targets: [
        .target(
            name: "AppSync",
            dependencies: [
            "Amplify",
            ]),
        .testTarget(
            name: "AppSyncTests",
            dependencies: ["AppSync"]),
    ]
)
