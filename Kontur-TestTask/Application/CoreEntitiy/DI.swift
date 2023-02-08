//
//  DI.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 08.02.2023.
//

import UIKit

final class DI {
    
    //MARK: Properties

    private let assemblyBuilder: AssemblyBuilder
    private let rootNavigationController: UINavigationController
    private let router: Router
    private let coordinatorsFactory: CoordinatorsFactory
    private let urlBuilder: URLBuilder
    let dataDecoder: DataDecoder
    let rocketAPIService: RocketAPIService
    
    //MARK: - Initialization
    
    init() {
        self.assemblyBuilder = AssemblyuBuilderImpl()
        self.rootNavigationController = UINavigationController()
        self.router = RouterImpl(rootController: rootNavigationController)
        self.coordinatorsFactory = CoordinatorsFactoryImpl(assemblyBuilder: assemblyBuilder)
        self.urlBuilder = URLBuilderImpl()
        self.rocketAPIService = RocketAPIServiceImpl(urlBuilder: self.urlBuilder)
        self.dataDecoder = DataDecoderImpl(decoder: JSONDecoder())
        
        if let builder = assemblyBuilder as? AssemblyuBuilderImpl {
            builder.di = self
        }
    }
}

//MARK: - AppFactory

extension DI: AppFactory {
    func makeKeyWindowAndCoordinator(with windowScene: UIWindowScene) -> (UIWindow, Coordinator) {
        let coordinator = coordinatorsFactory.createApplicationCoordinator(router: router)
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = rootNavigationController
        window.makeKeyAndVisible()
        return (window, coordinator)
    }
}
