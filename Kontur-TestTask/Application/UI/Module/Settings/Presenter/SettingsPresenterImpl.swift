//
//  SettingsPresenterImpl.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 11.02.2023.
//

import Foundation

final class SettingsPresenterImpl {
    
    //MARK: Properties
    
    unowned private let view: SettingsViewControllerProtocol
    private let coordinator: SettingsCoordinator
    
    //MARK: - Initialization
    
    init(view: SettingsViewControllerProtocol, coordinator: SettingsCoordinator) {
        self.view = view
        self.coordinator = coordinator
    }
}

//MARK: - SettingsPresenter

extension SettingsPresenterImpl: SettingsPresenter {
    var numberOfSettings: Int {
        SettingsOptions.count
    }
    
    func settingOptionForCell(at indexPath: IndexPath) -> SettingsOptions? {
        return SettingsOptions(rawValue: indexPath.row)
    }
    
    func close() {
        coordinator.dissmissPage()
    }
}
