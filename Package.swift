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
            name: "VideoLab",
            dependencies: [],
            path: "VideoLab/VideoLab",
            exclude: ["Info.plist"],
            resources: [
                .copy("VideoLab.bundle")
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
) 