//
//  Rocket.swift
//  Space-Challenge
//
//  Created by Rajmund Zawiślak on 29/04/2023.
//

import Foundation

struct Rocket: Codable {
    let id: Int
    let configuration: Configuration
}

extension Rocket {
    struct Configuration: Codable {
        let id: Int
        let url: String
        let name: String
        let family: String
        let fullName: String
        let variant: String
    }
}
