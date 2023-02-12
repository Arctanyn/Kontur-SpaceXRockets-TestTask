//
//  RocketPagesViewControllerProtocol.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 08.02.2023.
//

import UIKit

protocol RocketPagesViewControllerProtocol: LoadingIndicatorManagementProtocol where Self: UIViewController {
    func showErrorAlert(description: String)
}
