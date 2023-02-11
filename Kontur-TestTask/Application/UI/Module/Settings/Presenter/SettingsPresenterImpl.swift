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
    private let settings: Settings
    
    //MARK: - Initialization
    
    init(view: SettingsViewControllerProtocol,
         settings: Settings,
         coordinator: SettingsCoordinator) {
        self.view = view
        self.settings = settings
        self.coordinator = coordinator
    }
}

//MARK: - Private methods

private extension SettingsPresenterImpl {
    func currentUnitForSettingOption(_ settingOption: SettingsOptions) -> any Unit {
        switch settingOption {
        case .height, .diameter:
            return settings.getLenthUnit(forOption: settingOption)
        case .mass, .payload:
            return settings.getWeightUnit(forOption: settingOption)
        }
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
    
    func selectedIndexForCell(with settingOption: SettingsOptions) -> Int {
        let currentUnit = currentUnitForSettingOption(settingOption)
        return settingOption.units.firstIndex { currentUnit.designation == $0.designation } ?? 0
    }
    
    func saveSetting(forOption option: SettingsOptions, withUnitIndex index: Int) {
        guard (0..<option.units.count).contains(index) else { return }
        settings.setUnit(option.units[index], forOption: option)
    }
}
