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
            settings: di.settings,
            coordinator: coordinator
        )
        view.presenter = presenter
        return view
    }
    
    func createSettingsModule(coordinator: SettingsCoordinator) -> any PresentableView {
        let view = SettingsViewController()
        view.presenter = SettingsPresenterImpl(
            view: view,
            settings: di.settings,
            coordinator: coordinator
        )
        return view
    }
    
    func createLaunchesModule(rocket: Rocket, coordinator: LaunchesCoordinator) -> any PresentableView {
        let view = LaunchesViewController()
        view.presenter = LaunchesPresenterImpl(
            view: view,
            rocket: rocket,
            rocketAPIService: di.rocketAPIService,
            dataDecoder: di.dataDecoder,
            coordinator: coordinator
        )
        return view
    }
}
