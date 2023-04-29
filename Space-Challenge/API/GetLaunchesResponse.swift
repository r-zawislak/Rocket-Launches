//
//  GetLaunchesResponse.swift
//  Space-Challenge
//
//  Created by Rajmund Zawiślak on 29/04/2023.
//

import Foundation

struct GetLaunchesResponse: Codable {
    let count: Int
    let next: URL?
    let previous: URL?
    let results: [RocketLaunch]
}
