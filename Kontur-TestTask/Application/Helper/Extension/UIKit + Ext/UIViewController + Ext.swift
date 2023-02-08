//
//  UIViewController + Ext.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 07.02.2023.
//

import UIKit

extension UIViewController {
    var isNavigationController: Bool {
        self is UINavigationController
    }
    
    var statusBarHeight: CGFloat {
        view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    }
    
    var safeAreaTopInset: CGFloat {
        UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
    }
    
    var navigationBarHeight: CGFloat {
        navigationController?.navigationBar.frame.height ?? 0.0
    }
    
    var deviceNavigationStatusBarSafeAreaIndent: CGFloat {
        statusBarHeight + safeAreaTopInset + navigationBarHeight
    }
}

