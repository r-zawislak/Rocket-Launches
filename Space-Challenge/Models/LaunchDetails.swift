//
//  LaunchDetails.swift
//  Space-Challenge
//
//  Created by Rajmund Zawiślak on 30/04/2023.
//

import Foundation

struct LaunchDetails: Codable {
    let id: String
    let url: URL
    let name: String
    let status: RocketLaunch.Status
    let net: Date
    let launchServiceProvider: LaunchServiceProvider
    let rocket: Rocket
    let mission: Mission
    let webcastLive: Bool
    let image: URL?
    
    // details
    let updates: [UpdateComment]?
    let vidurls: [LaunchURL]?
    let infourls: [LaunchURL]?
}
