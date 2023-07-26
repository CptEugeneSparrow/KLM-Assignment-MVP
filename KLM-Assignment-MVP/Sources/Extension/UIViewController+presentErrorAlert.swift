//
//  UIViewController+presentError.swift
//  KLM Assignment
//
//  Created by Евгений Урбановский on 5/7/23.
//

import UIKit

extension UIViewController {
    func presentErrorAlert(on viewController: UIViewController) {
        let alertController = UIAlertController(
            title: "Loading Error",
            message: "An error occurred while loading data. Please try again.",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true)
    }
}


