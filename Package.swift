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
            name: "VideoLabC",
            dependencies: [],
            path: "Sources/VideoLab/include",
            sources: ["module.modulemap"],
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("."),
                .headerSearchPath("../Render/Operations")
            ]
        ),
        .target(
            name: "VideoLab",
            dependencies: ["VideoLabC"],
            path: "Sources/VideoLab",
            exclude: [
                "include/BlendModeConstants.h",
                "include/OperationConstants.h",
                "include/OperationShaderTypes.h",
                "include/module.modulemap"
            ],
            sources: [
                ".",
                "Audio",
                "Video",
                "Text",
                "Source",
                "Render",
                "Render/Operations",
                "Render/Base"
            ],
            resources: [
                .process("VideoLab.bundle")
            ],
            cSettings: [
                .headerSearchPath("include"),
                .headerSearchPath("Render/Operations")
            ],
            cxxSettings: [
                .headerSearchPath("include"),
                .headerSearchPath("Render/Operations")
            ],
            swiftSettings: [
                .define("SWIFT_PACKAGE"),
                .define("METAL_AVAILABLE"),
                .define("DEBUG", .when(configuration: .debug)),
                .define("RELEASE", .when(configuration: .release))
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