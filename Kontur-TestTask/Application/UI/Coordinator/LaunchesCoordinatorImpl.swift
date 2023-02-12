//
//  LaunchesCoordinatorImpl.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 12.02.2023.
//

import Foundation

final class LaunchesCoordinatorImpl: BaseCoordinator, LaunchesCoordinator {
    
    //MARK: Properties
    
    var finishFlow: VoidClosure?
    
    private let assemblyBuilder: AssemblyBuilder
    private let router: Router
    
    //MARK: - Initialization
    
    init(assemblyBuilder: AssemblyBuilder, router: Router) {
        self.assemblyBuilder = assemblyBuilder
        self.router = router
    }
    
    //MARK: - Overrided Methods
    
    override func start(with item: Any?) {
        guard let rocket = item as? Rocket else { return }
        let module = assemblyBuilder.createLaunchesModule(rocket: rocket, coordinator: self)
        router.push(module, animated: true, hideBar: false)
    }
}
