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
            publicHeadersPath: "."
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
            resources: [
                .process("VideoLab.bundle")
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