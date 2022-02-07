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
        path: String,
        paramaters paramatres: [String : String]? = nil,
        data: Codable? = nil,
        method: HTTPMethod,
        paginationOffset: Int,
        onSuccess: @escaping (T) -> Void,
        onError: @escaping (AFError) -> Void
    ) where T : Codable {

        AF.request(generateURL(path: path, offSet: paginationOffset),
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
    
    func generateURL(path: String, offSet: Int) -> URL {
        let newPath = path.replacingOccurrences(of: " ", with: "+")
        return Constant.NetworkConstant.generateURL(path: newPath, offSet: offSet)
    }
}
