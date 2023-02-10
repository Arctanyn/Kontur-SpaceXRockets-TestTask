//
//  RocketPagesViewControllerProtocol.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 08.02.2023.
//

import UIKit

protocol RocketPagesViewControllerProtocol: AnyObject where Self: UIViewController {
    func startLoadingInficator()
    func stopLoadingIndicator()
}
