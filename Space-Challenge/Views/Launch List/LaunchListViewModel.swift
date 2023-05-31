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
    @Published var canLoadMore = true
    
    private let provider = MoyaProvider<SpaceDevsEndpoint>()
    private var cancellables = Set<AnyCancellable>()
    private var pageNumber = 0
    private var isLoading = false
    
    private let decoder = JSONDecoder.spaceDevsDecoder
    
    func fetchMoreLaunches() {
        guard !isLoading && canLoadMore else {
            return
        }
        
        isLoading = true
        
        provider.requestPublisher(.getUpcomingLaunches(pageNumber: pageNumber))
            .map(GetLaunchesResponse.self, using: decoder)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                
                guard case let .failure(error) = completion else {
                    return
                }
                
                // Handle error
                print(error)
            }, receiveValue: { [weak self] response in
                guard let self else {
                    return
                }
                
                self.launches.append(contentsOf: response.results)
                self.canLoadMore = response.next != nil
                
                guard self.canLoadMore else {
                    return
                }
                
                self.pageNumber += 1
            })
            .store(in: &cancellables)
    }
}
