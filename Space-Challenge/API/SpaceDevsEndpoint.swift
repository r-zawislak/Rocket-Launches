//
//  SpaceDevsEndpoint.swift
//  Space-Challenge
//
//  Created by Rajmund Zawiślak on 29/04/2023.
//

import Moya
import Foundation

enum SpaceDevsEndpoint: TargetType {
    case getUpcomingLaunches(id: String?)
    
    var baseURL: URL {
        URL(string: "https://ll.thespacedevs.com/2.2.0/")!
    }
    
    var path: String {
        switch self {
        case .getUpcomingLaunches(let id):
            return "launch/upcoming/\(id ?? "")"
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
        .requestPlain
    }
    
    var sampleData: Data {
        let launches = (1...10).map { _ in RocketLaunch.mock }
        let response = GetLaunchesResponse(count: 10, next: nil, previous: nil, results: launches)
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        encoder.dateEncodingStrategy = .iso8601
        return (try? encoder.encode(response)) ?? Data()
    }
}
