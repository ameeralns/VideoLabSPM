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
            type: .dynamic,
            targets: ["VideoLab"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "VideoLab",
            dependencies: [],
            path: "Sources/VideoLab",
            exclude: [
                "Render/Operations/BlendModeConstants.h",
                "Render/Operations/OperationConstants.h",
                "Render/Operations/OperationShaderTypes.h"
            ],
            sources: [
                ".",
                "Render/Operations"
            ],
            resources: [
                .process("VideoLab.bundle")
            ],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("Render/Operations"),
                .headerSearchPath("include")
            ],
            cxxSettings: [
                .headerSearchPath("Render/Operations"),
                .headerSearchPath("include")
            ],
            swiftSettings: [
                .define("SWIFT_PACKAGE")
            ],
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("Metal"),
                .linkedFramework("MetalKit"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("QuartzCore")
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
) 