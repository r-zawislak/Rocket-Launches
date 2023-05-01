//
//  LaunchURL.swift
//  Space-Challenge
//
//  Created by Rajmund Zawiślak on 30/04/2023.
//

import Foundation

struct LaunchURL: Codable {
    let priority: Int
    let title: String
    let description: String
    let featureImage: URL?
    let url: URL
}
