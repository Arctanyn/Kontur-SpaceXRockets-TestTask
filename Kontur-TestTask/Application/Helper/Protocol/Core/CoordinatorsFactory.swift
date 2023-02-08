//
//  CoordinatorsFactory.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 08.02.2023.
//

protocol CoordinatorsFactory {
    func createApplicationCoordinator(router: Router) -> ApplicationCoordinator
    func createRocketInfoCoordinator(router: Router) -> RocketInfoCoordinator
}
