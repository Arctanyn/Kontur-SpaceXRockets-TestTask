//
//  RocketPagesCoordinator.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 10.02.2023.
//

import Foundation

protocol RocketPagesCoordinator where Self: Coordinator {
    var finishFlow: VoidClosure? { get set }
    func showRockets(_ rockets: [Rocket])
}


