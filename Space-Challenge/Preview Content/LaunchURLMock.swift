//
//  LaunchURLMock.swift
//  Space-Challenge
//
//  Created by Rajmund Zawiślak on 30/04/2023.
//

import Foundation

extension LaunchURL {
    static var mock: Self {
        Self(
            priority: .random(in: 0..<100),
            title: "Rocket Like A Hurricane",
            description: "Rocket Lab will launch NASA’s Time-Resolved Observations of Precipitation Structure and Storm Intensity with a Constellation of Smallsats (TROPICS) mission across two separate Electron launches.",
            featureImage: nil,
            url: URL(string: "https://www.nasa.gov/press-release/nasa-awards-launch-service-contract-for-tropics-mission-to-study-storm-processes")!
        )
    }
}
