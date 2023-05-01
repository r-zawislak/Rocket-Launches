//
//  LaunchDetailsViewModel.swift
//  Space-Challenge
//
//  Created by Rajmund Zawiślak on 29/04/2023.
//

import Combine
import Moya
import CombineMoya
import Foundation
import UIKit

final class LaunchDetailsViewModel: ObservableObject {
    let launch: RocketLaunch
    
    @Published var details: LaunchDetails?
    @Published var streamURL: URL?
    @Published var serviceProviderWebsite: URL?
    
    private let provider = MoyaProvider<SpaceDevsEndpoint>()
    private var cancellables = Set<AnyCancellable>()
    
    init(launch: RocketLaunch) {
        self.launch = launch
    }
    
    func fetchDetails() {
        guard details == nil else {
            return
        }
        
        provider.requestPublisher(.getLaunchDetails(id: launch.id))
            .map(LaunchDetails.self, using: .spaceDevsDecoder)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                guard case let .failure(error) = completion else {
                    return
                }
                
                // Handle error
                print(error)
            }, receiveValue: { [weak self] details in
                self?.details = details
                self?.streamURL = details.vidurls?.first?.url
                self?.serviceProviderWebsite = details.launchServiceProvider.infoUrl
            })
            .store(in: &cancellables)
    }
}
