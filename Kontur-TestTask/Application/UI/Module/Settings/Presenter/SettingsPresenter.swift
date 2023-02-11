//
//  SettingsPresenter.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 11.02.2023.
//

import Foundation

protocol SettingsPresenter: AnyObject {
    var numberOfSettings: Int { get }
    func settingOptionForCell(at indexPath: IndexPath) -> SettingsOptions?
    func close()
    func selectedIndexForCell(with settingOption: SettingsOptions) -> Int
    func saveSetting(forOption option: SettingsOptions, withUnitIndex index: Int)
}
