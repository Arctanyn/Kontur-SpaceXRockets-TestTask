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
    
    private var navigationControllers: [UINavigationController] = []
    
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
        let module = assemblyBuilder.createRocketPagesModule(
            viewControllers: [],
            coordinator: self
        )
        router.setRootModule(module, hideBar: true)
    }
}

//MARK: - Private methods

private extension ApplicationCoordinator {
    func runRocketPageFlow(with rocket: Rocket, navigationController: UINavigationController) {

        let router = RouterImpl(rootController: navigationController)
        let coordinator = coordinatorsFactory.createRocketInfoCoordinator(router: router)
        coordinator.finishFlow = { [weak self] in
            self?.childDidFinish(coordinator)
        }
        coordinator.start(with: rocket)
    }
}

//MARK: - ApplicationCoordinatorProtocol

extension ApplicationCoordinator: ApplicationCoordinatorProtocol {
    func showRockets(with rocketLaunches: [Rocket : [RocketLaunch]]) {
        for rocket in rocketLaunches.keys {
            let navigationController = UINavigationController()
            navigationControllers.append(navigationController)
            runRocketPageFlow(with: rocket, navigationController: navigationController)
        }
        
        if let pvc = (router.toPresent as? UINavigationController)?.topViewController as? RocketPagesViewController {
            pvc.setupViewControllers(navigationControllers)
        }
    }
}
