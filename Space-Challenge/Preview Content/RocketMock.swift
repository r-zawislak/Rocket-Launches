//
//  RocketMock.swift
//  Space-Challenge
//
//  Created by Rajmund Zawiślak on 29/04/2023.
//

import Foundation

extension Rocket {
    static var mock: Self {
        Self(id: 2142, configuration: .mock)
    }
}

extension Rocket.Configuration {
    static var mock: Self {
        Self(
            id: 161,
            url: "https://ll.thespacedevs.com/2.2.0/config/launcher/161/",
            name: "Falcon Heavy",
            family: "Falcon",
            fullName: "Falcon Heavy",
            variant: "Heavy"
        )
    }
}
