//
//  LaunchDetails.swift
//  Space-Challenge
//
//  Created by Rajmund Zawiślak on 30/04/2023.
//

import Foundation

extension LaunchDetails {
    static var mock: Self {
        Self.init(
            id: String(Int.random(in: 1...10000)),
            url: URL(string: "https://ll.thespacedevs.com/2.2.0/launch/8b1067dd-81c6-4bc3-b0f1-45f78963716f")!,
            name: "Falcon Heavy | ViaSat-3 Americas",
            status: .mock,
            net: .now.addingTimeInterval(.random(in: 2_000...100_000)),
            launchServiceProvider: .mock,
            rocket: .mock,
            mission: .mock,
            webcastLive: false,
            image: URL(string: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/falcon2520925_image_20230209214919.png")!,
            updates: [.mock, .mock, .mock],
            vidurls: [.mock],
            infourls: [.mock]
        )
    }
}
