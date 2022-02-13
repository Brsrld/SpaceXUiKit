//
//  Coordinator.swift
//  SpaceXUikit
//
//  Created by Barış Şaraldı on 7.02.2022.
//

import Foundation
import UIKit

enum Event {
    case goToDetail
}

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    func eventOccurred(with type: Event, item: Any)
    func start()
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}

class AppCoordinator: Coordinator {
   var navigationController: UINavigationController?

    func eventOccurred(with type: Event, item: Any) {
        switch type {
        case .goToDetail:
            var vc: UIViewController & Coordinating = LaunchDetailViewController(resultDetail: item as? SpaceXResponseModel)
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    func start() {
        let service: IService = Services()
        let viewModel = AllLaunchesViewModel(
            service: service,
            coordinator: self
        )
        let allLaunchesCollectionViewViewDelegate = AllLaunchesCollectionViewProvider()
        let vc: UIViewController = AllLaunchesViewController(service: service, viewModel: viewModel, allLaunchesCollectionViewViewDelegate: allLaunchesCollectionViewViewDelegate)
        navigationController?.setViewControllers([vc], animated: false)
    }
}
