//
//  MoyaProvider.swift
//  Space-Challenge
//
//  Created by Rajmund Zawiślak on 29/04/2023.
//

import Foundation
import Moya

var isPreview: Bool {
    ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
}

extension MoyaProvider {
    convenience init(decoder: JSONDecoder? = nil, stubClosure: @escaping StubClosure = neverStub) {
        
        self.init(
            stubClosure: isPreview ? Self.delayedStub(1) : stubClosure,
            plugins: [
                Logger(),
            ]
        )
    }
}
