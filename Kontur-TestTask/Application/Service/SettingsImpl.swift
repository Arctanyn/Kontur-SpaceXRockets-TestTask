//
//  SettingsImpl.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 11.02.2023.
//

import Foundation

final class SettingsImpl: Settings {
    
    //MARK: Properties
    
    private let userDefaults: UserDefaults
    private let decoder: JSONDecoder
    private let encoder: JSONEncoder
    
    //MARK: - Initialization
    
    init(userDefaults: UserDefaults, decoder: JSONDecoder, encoder: JSONEncoder) {
        self.userDefaults = userDefaults
        self.decoder = decoder
        self.encoder = encoder
        setDefaultSettings()
    }
    
    //MARK: - Methods
    
    func setUnit(_ unit: Unit, forOption option: SettingsOptions) {
        guard let data = try? encoder.encode(unit) else { return }
        userDefaults.set(data, forKey: Keys.keyForSettingOption(option))
        
        NotificationCenter.default.post(name: .settingsUpdate, object: nil)
    }
    
    func getLenthUnit(forOption option: SettingsOptions) -> LenghtUnit {
        guard let unit = getUnit(type: LenghtUnit.self, for: option) else {
            fatalError(SettingError.noDefaultSetting.localizedDescription)
        }
        return unit
    }
    
    func getWeightUnit(forOption option: SettingsOptions) -> WeightUnit {
        guard let unit = getUnit(type: WeightUnit.self, for: option) else {
            fatalError(SettingError.noDefaultSetting.localizedDescription)
        }
        return unit
    }
}

//MARK: - Private

private extension SettingsImpl {
    enum Keys {
        static func keyForSettingOption(_ option: SettingsOptions) -> String {
            switch option {
            case .height:
                return "height_setting_key"
            case .diameter:
                return "diameter_setting_key"
            case .mass:
                return "mass_setting_key"
            case .payload:
                return "payload_setting_key"
            }
        }
        
        static let entrance = "entrance_setting_key"
    }
    
    enum SettingError: LocalizedError {
        case noDefaultSetting
        
        var errorDescription: String? {
            switch self {
            case .noDefaultSetting:
                return "There is no default value for the specified setting"
            }
        }
    }
    
    //MARK: - Private methods
    
    func getUnit<UnitType: Decodable>(type: UnitType.Type, for option: SettingsOptions) -> UnitType? {
        guard
            let data = userDefaults.data(forKey: Keys.keyForSettingOption(option)),
            let unit = try? decoder.decode(UnitType.self, from: data)
        else { return nil }
        return unit
    }
    
    func setDefaultSettings() {
        guard userDefaults.bool(forKey: Keys.entrance) == false else { return }
        
        setUnit(LenghtUnit.feet, forOption: .height)
        setUnit(LenghtUnit.feet, forOption: .diameter)
        setUnit(WeightUnit.pound, forOption: .mass)
        setUnit(WeightUnit.pound, forOption: .payload)
        
        userDefaults.set(true, forKey: Keys.entrance)
    }
}
