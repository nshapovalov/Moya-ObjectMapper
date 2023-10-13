// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Moya-ObjectMapper",
    products: [
        .library(name: "Moya-ObjectMapper", targets: ["Moya-ObjectMapper"]),
        .library(name: "Moya-RxSwift-ObjectMapper", targets: ["Moya-RxSwift-ObjectMapper"]),
        .library(name: "Moya-ReactiveSwift-ObjectMapper", targets: ["Moya-ReactiveSwift-ObjectMapper"])
    ],
    dependencies: [
        .package(url: "https://github.com/Moya/Moya.git", .exact("14.0.0")),
        .package(url: "https://github.com/tristanhimmelman/ObjectMapper.git", .upToNextMajor(from: "3.4.0")),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "5.0.0"))
    ],
    targets: [
        .target(
            name: "Moya-ObjectMapper",
            dependencies: [
                "Moya",
                "ObjectMapper"],
            path: "Source/Core",
            exclude: [
                "Sample"]),
        .target(
            name: "Moya-RxSwift-ObjectMapper",
            dependencies: [
                "Moya",
                .product(name: "RxMoya", package: "Moya"),
                "ObjectMapper",
                "Moya-ObjectMapper",
                "RxSwift"],
            path: "Source/RxSwift",
            exclude: [
                "Sample"]),
        .target(
            name: "Moya-ReactiveSwift-ObjectMapper",
            dependencies: [
                "Moya",
                "ObjectMapper",
                "Moya-ObjectMapper",
                "ReactiveSwift",
                .product(name: "ReactiveMoya", package: "Moya")
            ],
            path: "Source/ReactiveSwift",
            exclude: [
                "Sample"])
    ]
)
