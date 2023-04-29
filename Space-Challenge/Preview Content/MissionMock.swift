//
//  MissionMock.swift
//  Space-Challenge
//
//  Created by Rajmund Zawiślak on 29/04/2023.
//

import Foundation

extension Mission {
    static var mock: Self {
        Self(
            id: 699,
            name: "iaSat-3 Americas",
            description: "The ViaSat-3 is a series of three Ka-band satellites is expected to provide vastly superior capabilities in terms of service speed and flexibility for a satellite platform. Each ViaSat-3 class satellite is expected to deliver more than 1-Terabit per second of network capacity, and to leverage high levels of flexibility to dynamically direct capacity to where customers are located.",
            type: "Communications",
            orbit: .mock
        )
    }
}

extension Mission.Orbit {
    static var mock: Self {
        Self.init(id: 8, name: "Low Earth Orbit", abbrev: "LOE")
    }
}
