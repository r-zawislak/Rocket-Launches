//
//  LaunchServiceProviderMock.swift
//  Space-Challenge
//
//  Created by Rajmund Zawiślak on 29/04/2023.
//

import Foundation

extension LaunchServiceProvider {
    static var mock: Self {
        Self(id: 121, url: URL(string: "https://ll.thespacedevs.com/2.2.0/agencies/121/")!, name: "SpaceX", type: .commercial)
    }
}
