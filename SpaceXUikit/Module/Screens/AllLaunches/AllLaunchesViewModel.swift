//
//  AllLaunchesViewModel.swift
//  SpaceXUikit
//
//  Created by Barış Şaraldı on 13.02.2022.
//

import Foundation
import Alamofire
import UIKit

protocol AllLaunchesViewModelProtocol {
    func goToDetailPage(itemDetail: SpaceXResponseModel)
    func setUpOutPutDelegate(_ viewController: AllLaunchesViewController)
}

protocol AllLaunchesViewModelOutput {
    func showData(launchs: [SpaceXResponseModel])
    func showError(error: String)
}

final class AllLaunchesViewModel: AllLaunchesViewModelProtocol, Coordinating {
    var coordinator: Coordinator?
    private var service: IService
    var allLaunchesViewModelOutputDelegate: AllLaunchesViewModelOutput?
    
    init(service: IService, coordinator: Coordinator) {
        self.service = service
        self.coordinator = coordinator
    }
}

extension AllLaunchesViewModel {
    
    func setUpOutPutDelegate(_ viewController: AllLaunchesViewController) {
        allLaunchesViewModelOutputDelegate = viewController
    }
    
    func fetchData() {
        service.fetchLaunches { [weak self] launchResults in
            guard let self = self else { return }
            
            self.allLaunchesViewModelOutputDelegate?.showData(launchs:launchResults)
            
            if launchResults.isEmpty {
                self.allLaunchesViewModelOutputDelegate?.showError(error: Constant.NetworkConstant.NOT_FOUND_ERROR)
            }
            
        } onError: { [weak self] error in
            self?.allLaunchesViewModelOutputDelegate?.showError(error: error.localizedDescription)
        }
    }
    
    func createPath() -> String {
        return Constant.NetworkConstant.BASE_URL
    }
 
    func goToDetailPage(itemDetail: SpaceXResponseModel) {
        coordinator?.eventOccurred(with: .goToDetail,item: itemDetail)
    }
}
