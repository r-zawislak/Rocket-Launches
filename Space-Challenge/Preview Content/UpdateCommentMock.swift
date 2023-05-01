//
//  UpdateCommentMock.swift
//  Space-Challenge
//
//  Created by Rajmund Zawiślak on 30/04/2023.
//

import Foundation

extension UpdateComment {
    static var mock: Self {
        Self(
            id: .random(in: 0..<100),
            profileImage: URL(string: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/profile_images/jay2520keegan_profile_20221218022555.jpg")!,
            comment: "Launch delayed to NET May 3rd as teams monitor a storm at the launch site.",
            createdBy: "Jay",
            createdOn: .now.addingTimeInterval(-3777)
        )
    }
}
