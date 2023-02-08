//
//  AssemblyBuilder.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 08.02.2023.
//

import UIKit

protocol AssemblyBuilder {
    func createRocketPagesModule(viewControllers: [UIViewController],
                                 coordinator: ApplicationCoordinatorProtocol) -> any PresentableView
    
    func createRocketInfoModule(rocket: Rocket) -> any PresentableView
}
