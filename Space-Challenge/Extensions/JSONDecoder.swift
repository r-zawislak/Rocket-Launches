//
//  JSONDecoder.swift
//  Space-Challenge
//
//  Created by Rajmund Zawiślak on 30/04/2023.
//

import Foundation

extension JSONDecoder {
    static var spaceDevsDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
}
