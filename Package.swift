// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "VideoLab",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "VideoLab",
            type: .static,
            targets: ["VideoLab"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "VideoLabC",
            dependencies: [],
            path: "Sources/VideoLab/include",
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("."),
                .headerSearchPath("../Render/Operations")
            ],
            cxxSettings: [
                .headerSearchPath("."),
                .headerSearchPath("../Render/Operations")
            ]
        ),
        .target(
            name: "VideoLab",
            dependencies: ["VideoLabC"],
            path: "Sources/VideoLab",
            exclude: [
                "include/module.modulemap"
            ],
            resources: [
                .process("VideoLab.bundle")
            ],
            cSettings: [
                .headerSearchPath("include"),
                .headerSearchPath("Render/Operations"),
                .headerSearchPath(".")
            ],
            cxxSettings: [
                .headerSearchPath("include"),
                .headerSearchPath("Render/Operations"),
                .headerSearchPath(".")
            ],
            swiftSettings: [
                .define("SWIFT_PACKAGE"),
                .define("METAL_AVAILABLE"),
                .unsafeFlags([
                    "-Xcc", "-fmodule-map-file=Sources/VideoLab/include/module.modulemap"
                ])
            ],
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("Metal"),
                .linkedFramework("MetalKit"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("QuartzCore"),
                .linkedFramework("CoreVideo"),
                .linkedFramework("Photos"),
                .linkedFramework("UIKit"),
                .linkedFramework("CoreImage")
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
) 