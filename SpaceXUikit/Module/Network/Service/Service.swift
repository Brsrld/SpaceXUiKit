//
//  Service.swift
//  SpaceXUikit
//
//  Created by Barış Şaraldı on 7.02.2022.
//

import Foundation
import Alamofire

final class ServiceManager {
    public static let shared: ServiceManager = ServiceManager()
    private init () {}
}

extension ServiceManager {

    func fetch<T>(
        paramaters paramatres: [String : String]? = nil,
        data: Codable? = nil,
        method: HTTPMethod,
        onSuccess: @escaping (T) -> Void,
        onError: @escaping (AFError) -> Void
    ) where T : Codable {

        AF.request(generateURL(),
                   method: method,
                   encoding: JSONEncoding.default
        ).validate().responseDecodable(of: T.self) { (response) in
            guard let model = response.value else {
                onError(response.error!)
                return
            }
            onSuccess(model)
        }
    }
    
    func generateURL() -> URL {
        return Constant.NetworkConstant.generateURL()
    }
}
