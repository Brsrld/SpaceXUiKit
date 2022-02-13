//
//  Services.swift
//  SpaceXUikit
//
//  Created by Barış Şaraldı on 7.02.2022.
//

import Foundation
import Alamofire

protocol IService {
    func fetchLaunches(
        onSuccess: @escaping ([SpaceXResponseModel]) -> Void,
        onError: @escaping (AFError) -> Void
    )
}

final class Services: IService {
    func fetchLaunches( onSuccess: @escaping ([SpaceXResponseModel]) -> Void, onError: @escaping (AFError) -> Void) {
        ServiceManager.shared.fetch(method: .get) { (response: [SpaceXResponseModel]) in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }
    }
}
