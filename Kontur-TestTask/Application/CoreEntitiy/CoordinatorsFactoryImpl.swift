//
//  CoordinatorsFactoryImpl.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 08.02.2023.
//

import Foundation

final class CoordinatorsFactoryImpl {
    
    //MARK: Properties
    
    private let assemblyBuilder: AssemblyBuilder
    
    //MARK: - Initialization
    
    init(assemblyBuilder: AssemblyBuilder) {
        self.assemblyBuilder = assemblyBuilder
    }
}

//MARK: - CoordinatorsFactory

extension CoordinatorsFactoryImpl: CoordinatorsFactory {
    func createApplicationCoordinator(router: Router, settings: Settings) -> ApplicationCoordinator {
        return ApplicationCoordinator(
            assemblyBuilder: assemblyBuilder,
            coordinatorsFactory: self,
            router: router,
            settings: settings
        )
    }
    
    func createRocketPagesCoordinator(router: Router) -> RocketPagesCoordinator {
        return RocketPagesCoordinatorImpl(assemblyBuilder: assemblyBuilder, coordinatorsFactory: self, router: router)
    }
    
    func createRocketInfoCoordinator(router: Router,
                                     launchDisplayRequestHandler: ((Rocket) -> Void)?) -> RocketInfoCoordinator {
        RocketInfoCoordinatorImpl(
            assemblyBuilder: assemblyBuilder,
            coordinatorsFactory: self,
            router: router,
            launchDisplayRequestHandler: launchDisplayRequestHandler
        )
    }
    
    func createSettingsCoordinator(router: Router) -> SettingsCoordinator {
        return SettingsCoordinatorImpl(assemblyBuilder: assemblyBuilder, router: router)
    }
    
    func createLaunchesCoordinator(router: Router) -> LaunchesCoordinator {
        return LaunchesCoordinatorImpl(assemblyBuilder: assemblyBuilder, router: router)
    }
}
