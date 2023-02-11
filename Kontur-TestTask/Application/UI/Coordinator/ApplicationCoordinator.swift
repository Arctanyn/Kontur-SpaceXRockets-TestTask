//
//  ApplicationCoordinator.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 08.02.2023.
//

import UIKit

final class ApplicationCoordinator: BaseCoordinator {
    
    //MARK: Properties
    
    private let assemblyBuilder: AssemblyBuilder
    private let coordinatorsFactory: CoordinatorsFactory
    private let router: Router
    
    //MARK: - Initialization
    
    init(assemblyBuilder: AssemblyBuilder,
         coordinatorsFactory: CoordinatorsFactory,
         router: Router) {
        self.assemblyBuilder = assemblyBuilder
        self.coordinatorsFactory = coordinatorsFactory
        self.router = router
    }
    
    //MARK: - Overrided Methods
    
    override func start(with item: Any?) {
        runRocketPagesFlow()
    }
}

//MARK: - Private methods

private extension ApplicationCoordinator {
    func runRocketPagesFlow() {
        let coordinator = coordinatorsFactory.createRocketPagesCoordinator(router: self.router)
        coordinator.finishFlow = { [weak self] in
            self?.childDidFinish(coordinator)
        }
        coordinator.start(with: nil)
    }
}
