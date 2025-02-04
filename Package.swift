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
            resources: [
                .process("VideoLab.bundle")
            ],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("."),
                .headerSearchPath("include"),
                .headerSearchPath("Render/Operations")
            ],
            cxxSettings: [
                .headerSearchPath("."),
                .headerSearchPath("include"),
                .headerSearchPath("Render/Operations")
            ],
            swiftSettings: [
                .define("SWIFT_PACKAGE"),
                .unsafeFlags(["-suppress-warnings"])
            ],
            linkerSettings: [
                .linkedFramework("AVFoundation", .when(platforms: [.iOS])),
                .linkedFramework("Metal", .when(platforms: [.iOS])),
                .linkedFramework("MetalKit", .when(platforms: [.iOS])),
                .linkedFramework("CoreMedia", .when(platforms: [.iOS])),
                .linkedFramework("CoreGraphics", .when(platforms: [.iOS])),
                .linkedFramework("QuartzCore", .when(platforms: [.iOS]))
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
) 