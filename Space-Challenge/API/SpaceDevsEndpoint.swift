//
//  SpaceDevsEndpoint.swift
//  Space-Challenge
//
//  Created by Rajmund Zawiślak on 29/04/2023.
//

import Moya
import Foundation

enum SpaceDevsEndpoint: TargetType {
    case getUpcomingLaunches(pageNumber: Int)
    case getLaunchDetails(id: String)
    
    var baseURL: URL {
        URL(string: "https://ll.thespacedevs.com/2.2.0/")!
    }
    
    var path: String {
        switch self {
        case .getUpcomingLaunches:
            return "launch/upcoming"
        case .getLaunchDetails(let id):
            return "launch/\(id)"
        }
    }
    
    var headers: [String : String]? {
        [
            "Accept-Language" : Locale.preferredLanguages[0],
            "Content-type": "application/json",
            "accept" : "application/json",
        ]
            .compactMapValues { $0 }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var validationType: ValidationType {
        .successCodes
    }
    
    var task: Task {
        switch self {
        case .getLaunchDetails:
            return .requestPlain
        case .getUpcomingLaunches(let pageNumber):
            let itemsPerPage = 10
            return .requestParameters(
                parameters: [
                    "limit" : itemsPerPage,
                    "offset" : pageNumber * itemsPerPage
                ],
                encoding: URLEncoding.queryString
            )
        }
    }
    
    var sampleData: Data {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        encoder.dateEncodingStrategy = .iso8601
        
        switch self {
        case .getUpcomingLaunches:
            let launches = (1...10).map { _ in RocketLaunch.mock }
            let response = GetLaunchesResponse(count: 10, next: nil, previous: nil, results: launches)
            return (try? encoder.encode(response)) ?? Data()
        case .getLaunchDetails:
            return (try? encoder.encode(LaunchDetails.mock)) ?? Data()
        }
    }
}
