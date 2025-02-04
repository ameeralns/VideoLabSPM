// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "VideoLab",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "VideoLab",
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
            resources: [
                .process("VideoLab.bundle")
            ],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include"),
                .headerSearchPath("Render/Operations")
            ],
            cxxSettings: [
                .headerSearchPath("include"),
                .headerSearchPath("Render/Operations")
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