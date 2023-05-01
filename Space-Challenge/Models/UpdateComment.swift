//
//  UpdateComment.swift
//  Space-Challenge
//
//  Created by Rajmund Zawiślak on 30/04/2023.
//

import Foundation

struct UpdateComment: Codable, Identifiable {
    let id: Int
    let profileImage: URL?
    let comment: String
    let createdBy: String
    let createdOn: Date
}
