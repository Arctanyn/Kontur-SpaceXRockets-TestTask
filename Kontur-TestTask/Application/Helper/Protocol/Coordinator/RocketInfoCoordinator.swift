//
//  RocketInfoCoordinator.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 08.02.2023.
//

protocol RocketInfoCoordinator where Self: Coordinator {
    var finishFlow: VoidClosure? { get set }
}
