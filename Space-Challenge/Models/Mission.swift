//
//  Mission.swift
//  Space-Challenge
//
//  Created by Rajmund Zawiślak on 29/04/2023.
//

import Foundation

struct Mission: Codable {
    let id: Int
    let name: String
    let description: String?
    let type: String
    let orbit: Orbit
}

extension Mission {
    struct Orbit: Codable {
        let id: Int
        let name: String
        let abbrev: String
    }
}
