//
//  Constant+Network.swift
//  SpaceXUikit
//
//  Created by Barış Şaraldı on 7.02.2022.
//

import Foundation

extension Constant {
    class NetworkConstant {
        static let BASE_URL = "https://api.spacexdata.com/v4/launches"
        static let NOT_FOUND_ERROR = "We Couldn't Find Anything"
        static func generateURL() -> URL {
            let url = BASE_URL
            return URL(string: url)!
        }
    }
}
