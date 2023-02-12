//
//  RouterImpl.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 08.02.2023.
//

import UIKit

final class RouterImpl {
    
    //MARK: Properties
    
    private var rootController: UINavigationController
    
    var toPresent: UIViewController {
        rootController
    }
    
    //MARK: - Initialization
    
    init(rootController: UINavigationController) {
        self.rootController = rootController
    }
}

//MARK: - Router

extension RouterImpl: Router {
    func setRootModule(_ module: Presentable, hideBar: Bool) {
        let controller = module.toPresent
        rootController.viewControllers = [controller]
        hideNavigationBar(hideBar)
    }
    
    func present(_ module: Presentable, animated: Bool) {
        present(module, animated: animated, completion: nil)
    }
    
    func present(_ module: Presentable, animated: Bool, completion: VoidClosure?) {
        let controller = module.toPresent
        rootController.present(controller, animated: animated, completion: completion)
    }
    
    func presentInNavigation(_ module: Presentable, animated: Bool, fullScreen: Bool) {
        let controller = module.toPresent
        let navController = UINavigationController(rootViewController: controller)
        navController.modalPresentationStyle = fullScreen ? .fullScreen : .automatic
        rootController.present(navController, animated: true)
    }
    
    func dismiss(animated: Bool) {
        dismiss(animated: animated, completion: nil)
    }
    
    func dismiss(animated: Bool, completion: VoidClosure?) {
        rootController.dismiss(animated: animated, completion: completion)
    }
    
    func push(_ module: Presentable, animated: Bool, hideBar: Bool) {
        let controller = module.toPresent
        guard !(controller.isNavigationController) else {
            fatalError("The module must be of type UIViewController, not UINavigationController")
        }
        hideNavigationBar(hideBar)
        rootController.pushViewController(controller, animated: animated)
    }
    
    func popModule(animated: Bool) {
        rootController.popViewController(animated: animated)
    }
    
    func popToRootModule(animated: Bool) {
        rootController.popToRootViewController(animated: animated)
    }
    
    func hideNavigationBar(_ hide: Bool) {
        rootController.isNavigationBarHidden = hide
    }
}
