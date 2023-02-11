//
//  SettingsCoordinator.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 11.02.2023.
//

protocol SettingsCoordinator where Self: Coordinator {
    var finishFlow: VoidClosure? { get set }
    func dissmissPage()
}
