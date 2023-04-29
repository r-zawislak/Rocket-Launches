//
//  StatusMock.swift
//  Space-Challenge
//
//  Created by Rajmund Zawiślak on 29/04/2023.
//

import Foundation

extension RocketLaunch.Status {
    static var mock: Self {
        Self.init(id: 1, name: "Go for Launch", abbrev: "Go", description: "Current T-0 confirmed by official or reliable sources.")
    }
}
