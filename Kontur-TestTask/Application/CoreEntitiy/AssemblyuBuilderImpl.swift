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
    
    func createRocketInfoModule(rocket: Rocket) -> any PresentableView {
        let view = RocketInfoViewController()
        let presenter = RocketPresenterImpl(
            rocket: rocket,
            view: view
        )
        view.presenter = presenter
        return view
    }
}
