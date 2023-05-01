//
//  LaunchServiceProviderMock.swift
//  Space-Challenge
//
//  Created by Rajmund Zawiślak on 29/04/2023.
//

import Foundation

extension LaunchServiceProvider {
    static var mock: Self {
        Self(
            id: 121,
            url: URL(string: "https://ll.thespacedevs.com/2.2.0/agencies/121/")!,
            name: "SpaceX",
            type: .commercial,
            countryCode: "USA",
            description: "Rocket Lab is an American aerospace manufacturer with a wholly owned New Zealand subsidiary. The company develops lightweight, cost-effective commercial rocket launch services. The Electron Program was founded on the premise that small payloads such as CubeSats require dedicated small launch vehicles and flexibility not currently offered by traditional rocket systems. Its rocket, the Electron, is a light-weight rocket and is now operating commercially. Electron currently launches from only Mahia Peninsula in New Zealand however a second launch complex in the US is under development.",
            logoUrl: URL(string:"https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/logo/rocket2520lab2520ltd_logo_20220218075411.png")!,
            infoUrl: URL(string:"http://www.rocketlabusa.com/")!
        )
    }
}
