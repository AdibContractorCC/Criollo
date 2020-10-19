// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Criollo",
    products: [
        .library(
            name: "Criollo",
            targets: ["Criollo"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/robbiehanson/CocoaAsyncSocket", from: "7.6.4")
    ],
    targets: [
        .binaryTarget(name: "openssl",
                      path: "openssl.xcframework"),
        .target(
            name: "Criollo",
            dependencies: ["CocoaAsyncSocket", "openssl"],
            path: "Criollo",
            exclude: ["../Libraries/*","Criollo-Prefix.pch", "Criollo-Info.plist"],
            publicHeadersPath: "SPMHeaderLinks",
            cSettings: [
                .headerSearchPath("AllHeaderLinks")
            ]
        )
    ]
)
