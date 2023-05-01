//
//  LaunchListViewModel.swift
//  Space-Challenge
//
//  Created by Rajmund Zawiślak on 29/04/2023.
//

import CombineMoya
import Moya
import Combine
import Foundation

final class LaunchListViewModel: ObservableObject {
    
    @Published var launches: [RocketLaunch] = []
    @Published var canLoadMore = false
    
    private let provider = MoyaProvider<SpaceDevsEndpoint>()
    private var cancellables = Set<AnyCancellable>()
    private var lastResponse: GetLaunchesResponse?
    
    private let decoder = JSONDecoder.spaceDevsDecoder
    
    func fetchLaunches() {
        let lastId = lastResponse?.results.last?.id
        
        provider.requestPublisher(.getUpcomingLaunches(id: lastId))
            .map(GetLaunchesResponse.self, using: decoder)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                guard case let .failure(error) = completion else {
                    return
                }
                
                // Handle error
                print(error)
            }, receiveValue: { [weak self] response in
                self?.lastResponse = response
                self?.launches.append(contentsOf: response.results)
                self?.canLoadMore = response.next != nil
            })
            .store(in: &cancellables)
    }
}
