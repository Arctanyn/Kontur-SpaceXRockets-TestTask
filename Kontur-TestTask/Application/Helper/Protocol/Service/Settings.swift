//
//  Settings.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 11.02.2023.
//

protocol Settings {
    func setUnit(_ unit: Unit, forOption option: SettingsOptions)
    func getLenthUnit(forOption option: SettingsOptions) -> LenghtUnit
    func getWeightUnit(forOption option: SettingsOptions) -> WeightUnit
}
