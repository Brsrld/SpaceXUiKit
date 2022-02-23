//
//  UIViewController+Extension.swift
//  SpaceXUikit
//
//  Created by Barış Şaraldı on 13.02.2022.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {
                UIAlertAction in
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
}
