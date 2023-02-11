//
//  AssemblyuBuilderImpl.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 06.02.2023.
//

import UIKit

final class AssemblyuBuilderImpl: AssemblyBuilder {
    
    //MARK: Properties
    
    weak var di: DI!
    
    //MARK: - Methods
    
    func createRocketPagesModule(viewControllers: [UIViewController], coordinator: RocketPagesCoordinator) -> any PresentableView {
        let view = RocketPagesViewController()
        view.presenter = RocketPagesPresenterImpl(
            view: view,
            rocketAPIService: di.rocketAPIService,
            dataDecoder: di.dataDecoder,
            coordinator: coordinator
        )
        view.setupViewControllers(viewControllers)
        return view
    }
    
    func createRocketInfoModule(rocket: Rocket, coordinator: RocketInfoCoordinator) -> any PresentableView {
        let view = RocketInfoViewController()
        let presenter = RocketInfoPresenterImpl(
            rocket: rocket,
            view: view,
            coordinator: coordinator
        )
        view.presenter = presenter
        return view
    }
    
    func createSettingsModule(coordinator: SettingsCoordinator) -> any PresentableView {
        let view = SettingsViewController()
        view.presenter = SettingsPresenterImpl(
            view: view,
            coordinator: coordinator
        )
        return view
    }
}
