//
//  LaunchDetailViewController.swift
//  SpaceXUikit
//
//  Created by Barış Şaraldı on 13.02.2022.
//

import UIKit

class LaunchDetailViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    private var resultDetail: SpaceXResponseModel
    
    init(resultDetail: SpaceXResponseModel?) {
        self.resultDetail = resultDetail!
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
