//
//  LaunchesViewControllerProtocol.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 12.02.2023.
//

import UIKit

protocol LaunchesViewControllerProtocol: LoadingIndicatorManagementProtocol where Self: UIViewController {
    func reloadData()
    func displayLaunchesAbsence()
    func showErrorAlert(description: String)
}

