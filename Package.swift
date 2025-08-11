// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "libzmq",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "libzmq",
            targets: ["libzmq"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/decentralised-dataexchange/libsodium", from: "2025.8.1")
    ],
    targets: [
        .target(
            name: "libzmq",
            dependencies: [
                .product(name: "libsodium", package: "libsodium")
            ],
            path: "Sources/libzmq",
            exclude: [
                "tweetnacl.c",
                "tweetnacl.h"
            ],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include")
            ]
        )
    ]
)
