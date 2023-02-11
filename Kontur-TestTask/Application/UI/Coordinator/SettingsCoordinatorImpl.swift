//
//  SettingsCoordinatorImpl.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 11.02.2023.
//

import Foundation

final class SettingsCoordinatorImpl: BaseCoordinator, SettingsCoordinator {
    
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
        let module = assemblyBuilder.createSettingsModule(coordinator: self)
        router.presentInNavigation(module, animated: true, fullScreen: false)
    }
    
    //MARK: - Methods
    
    func dissmissPage() {
        router.dismiss(animated: true)
        finishFlow?()
    }
}
