//
//  Services.swift
//  SpaceXUikit
//
//  Created by Barış Şaraldı on 7.02.2022.
//

import Foundation
import Alamofire

protocol IService {
    func searchItem(
        path: String,
        paginationOffset: Int,
        onSuccess: @escaping (SpaceXResponseModel?) -> Void,
        onError: @escaping (AFError) -> Void
    )
}

final class Services: IService {
    func searchItem(path: String, paginationOffset: Int, onSuccess: @escaping (SpaceXResponseModel?) -> Void, onError: @escaping (AFError) -> Void) {
        ServiceManager.shared.fetch(path: path, method: .get, paginationOffset: paginationOffset) { (response: SpaceXResponseModel) in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }
    }
}
