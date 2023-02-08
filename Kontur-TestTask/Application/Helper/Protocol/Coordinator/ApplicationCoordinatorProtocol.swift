//
//  ApplicationCoordinatorProtocol.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 08.02.2023.
//

import Foundation

protocol ApplicationCoordinatorProtocol where Self: Coordinator {
    func showRockets(with rocketLaunches: [Rocket: [RocketLaunch]])
}
