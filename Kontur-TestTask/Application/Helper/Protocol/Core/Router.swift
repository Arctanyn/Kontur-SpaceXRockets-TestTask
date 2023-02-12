//
//  Router.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 08.02.2023.
//

protocol Router: Presentable {
    func setRootModule(_ module: Presentable, hideBar: Bool)
    
    func present(_ module: Presentable, animated: Bool)
    func present(_ module: Presentable, animated: Bool, completion: VoidClosure?)
    
    func presentInNavigation(_ module: Presentable, animated: Bool, fullScreen: Bool)
    
    func dismiss(animated: Bool)
    func dismiss(animated: Bool, completion: VoidClosure?)
    
    func push(_ module: Presentable, animated: Bool, hideBar: Bool)
    func popModule(animated: Bool)
    func popToRootModule(animated: Bool)
    
    func hideNavigationBar(_ hide: Bool)
}
