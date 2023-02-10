//
//  RocketPagesCoordinatorImpl.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 10.02.2023.
//

import UIKit

final class RocketPagesCoordinatorImpl: BaseCoordinator, RocketPagesCoordinator {
    
    //MARK: Properties
    
    var finishFlow: VoidClosure?
    
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
    
    //MARK: - Methods
    
    override func start(with item: Any?) {
        let module = assemblyBuilder.createRocketPagesModule(viewControllers: navigationControllers, coordinator: self)
        router.setRootModule(module, hideBar: true)
    }
    
    func showRockets(_ rockets: [Rocket]) {
        for rocket in rockets {
            let navigationController = UINavigationController()
            navigationControllers.append(navigationController)
            runRocketPageFlow(with: rocket, navigationController: navigationController)
        }
        
        setupRootViewController(with: navigationControllers)
    }
}

//MARK: - Private methods

private extension RocketPagesCoordinatorImpl {
    func runRocketPageFlow(with rocket: Rocket, navigationController: UINavigationController) {
        let router = RouterImpl(rootController: navigationController)
        let coordinator = coordinatorsFactory.createRocketInfoCoordinator(router: router)
        coordinator.finishFlow = { [weak self] in
            self?.childDidFinish(coordinator)
        }
        coordinator.start(with: rocket)
    }

    func setupRootViewController(with viewControllers: [UIViewController]) {
        guard
            let navController = router.toPresent as? UINavigationController,
            let rocketPagesVC = navController.topViewController as? RocketPagesViewController
        else { return }
        
        rocketPagesVC.setupViewControllers(viewControllers)
    }
}
