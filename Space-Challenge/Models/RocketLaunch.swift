//
//  RocketLaunch.swift
//  Space-Challenge
//
//  Created by Rajmund Zawiślak on 29/04/2023.
//

import Foundation

struct RocketLaunch: Codable, Identifiable {
    let id: String
    let url: URL
    let name: String
    let status: Status
    let net: Date
    let launchServiceProvider: LaunchServiceProvider
    let rocket: Rocket
    let mission: Mission?
    let webcastLive: Bool
    let image: URL?
}

extension RocketLaunch: Equatable {
    static func == (lhs: RocketLaunch, rhs: RocketLaunch) -> Bool {
        lhs.id == rhs.id
    }
}
