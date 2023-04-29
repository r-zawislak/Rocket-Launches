//
//  Data.swift
//  Space-Challenge
//
//  Created by Rajmund Zawiślak on 29/04/2023.
//

import Foundation

extension Data {
    var formattedJSONString: String {
        guard
            let json = try? JSONSerialization.jsonObject(with: self, options: .mutableContainers),
            let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        else {
            return ""
        }
        
        return String(decoding: jsonData, as: UTF8.self)
    }
}
