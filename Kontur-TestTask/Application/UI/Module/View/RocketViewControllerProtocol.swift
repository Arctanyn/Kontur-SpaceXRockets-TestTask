//
//  RocketViewControllerProtocol.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 06.02.2023.
//

import UIKit

protocol RocketViewControllerProtocol: AnyObject where Self: UIViewController {
    func reloadData(in sections: IndexSet)
}
