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
    func createApplicationCoordinator(router: Router) -> ApplicationCoordinator {
        return ApplicationCoordinator(assemblyBuilder: assemblyBuilder, coordinatorsFactory: self, router: router)
    }
    
    func createRocketPagesCoordinator(router: Router) -> RocketPagesCoordinator {
        return RocketPagesCoordinatorImpl(assemblyBuilder: assemblyBuilder, coordinatorsFactory: self, router: router)
    }
    
    func createRocketInfoCoordinator(router: Router) -> RocketInfoCoordinator {
        RocketInfoCoordinatorImpl(assemblyBuilder: assemblyBuilder, coordinatorsFactory: self, router: router)
    }
}
