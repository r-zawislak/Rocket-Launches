//
//  LaunchServiceProvider.swift
//  Space-Challenge
//
//  Created by Rajmund Zawiślak on 29/04/2023.
//

import Foundation

struct LaunchServiceProvider: Codable {
    let id: Int
    let url: URL
    let name: String
    let type: Type
    
    // Only in details
    let countryCode: String?
    let description: String?
    let logoUrl: URL?
    let infoUrl: URL?
}

extension LaunchServiceProvider {
    enum `Type`: String, Codable {
        case commercial = "Commercial"
        case government = "Government"
        case multinational = "Multinational"
    }
}
