//
//  LaunchesCoordinator.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 12.02.2023.
//

protocol LaunchesCoordinator where Self: Coordinator {
    var finishFlow: VoidClosure? { get set }
}
