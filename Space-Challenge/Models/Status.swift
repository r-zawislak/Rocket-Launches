//
//  Status.swift
//  Space-Challenge
//
//  Created by Rajmund Zawiślak on 29/04/2023.
//

import Foundation

extension RocketLaunch {
    struct Status: Codable {
        let id: Int
        let name: String
        let abbrev: String
        let description: String
    }
}
