//
//  RocketInfoCoordinatorImpl.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 08.02.2023.
//

import Foundation

final class RocketInfoCoordinatorImpl: BaseCoordinator, RocketInfoCoordinator {

    //MARK: Properties
    
    var finishFlow: VoidClosure?

    private let assemblyBuilder: AssemblyBuilder
    private let coordinatorsFactory: CoordinatorsFactory
    private let router: Router
    
    //MARK: - Initialization
    
    init(assemblyBuilder: AssemblyBuilder, coordinatorsFactory: CoordinatorsFactory, router: Router) {
        self.assemblyBuilder = assemblyBuilder
        self.coordinatorsFactory = coordinatorsFactory
        self.router = router
    }
    
    //MARK: - Overrided Methods
    
    override func start(with item: Any?) {
        guard let rocket = item as? Rocket else { return }
        let module = assemblyBuilder.createRocketInfoModule(rocket: rocket)
        router.setRootModule(module, hideBar: true)
    }
}
