//
//  CoordinatorsFactory.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 08.02.2023.
//

protocol CoordinatorsFactory {
    func createApplicationCoordinator(router: Router, settings: Settings) -> ApplicationCoordinator
    
    func createRocketPagesCoordinator(router: Router) -> RocketPagesCoordinator
    
    func createRocketInfoCoordinator(router: Router,
                                     launchDisplayRequestHandler: ((Rocket) -> Void)?) -> RocketInfoCoordinator
    
    func createSettingsCoordinator(router: Router) -> SettingsCoordinator
    
    func createLaunchesCoordinator(router: Router) -> LaunchesCoordinator
}
