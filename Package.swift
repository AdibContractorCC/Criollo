// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Criollo",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Criollo",
            targets: ["Criollo"]),
    ],
    dependencies: [
        .package(url: "https://github.com/robbiehanson/CocoaAsyncSocket", from: "7.6.4")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(
            name: "openssl",
            path: "openssl.xcframework"
        ),
        .target(
            name: "Criollo",
            dependencies: ["CocoaAsyncSocket", "openssl"],
            path: "Criollo",
            exclude: ["../Libraries", "Criollo-Prefix.pch", "Criollo-Info.plist"],
            publicHeadersPath: "SPMHeaderLinks",
            cSettings: [
                .headerSearchPath("AllHeaderLinks")
            ]
        )
    ]
)
