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
    
    func createRocketPagesModule() -> any PresentableView {
        let view = RocketPagesViewController()
        view.presenter = RocketPagesPresenterImpl(
            view: view,
            rocketAPIService: di.rocketAPIService
        )
        return view
    }
    
    func createRocketInfoModule(rocket: Rocket) -> any PresentableView {
        let view = RocketViewController()
        let presenter = RocketPresenterImpl(
            rocket: rocket,
            view: view,
            rocketAPIService: RocketAPIServiceImpl(urlBuilder: URLBuilderImpl())
        )
        view.presenter = presenter
        return view
    }
}
