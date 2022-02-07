//
//  Constant+Network.swift
//  SpaceXUikit
//
//  Created by Barış Şaraldı on 7.02.2022.
//

import Foundation

extension Constant {
    class NetworkConstant {
        static let TERM = "term="
        static let BASE_URL = "https://api.spacexdata.com/v4/launches"
        static let NOT_FOUND_ERROR = "We Couldn't Find Anything"
        static func generateURL(path: String, offSet: Int) -> URL {
            var url = BASE_URL
            url += path + "&offset=\(offSet)&limit=20"
            return URL(string: url)!
        }
    }
}
