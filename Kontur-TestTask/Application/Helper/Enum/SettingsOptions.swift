//
//  SettingsOptions.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 07.02.2023.
//

enum SettingsOptions: Int, CaseIterable {
    case height
    case diameter
    case mass
    case payload
    
    var name: String {
        switch self {
        case .height:
            return "Height"
        case .diameter:
            return "Diameter"
        case .mass:
            return "Mass"
        case .payload:
            return "Payload"
        }
    }
    
    var units: [Unit] {
        switch self {
        case .height, .diameter:
            return [LenghtUnit.meter, LenghtUnit.feet]
        case .mass, .payload:
            return [WeightUnit.kilogram, WeightUnit.pound]
        }
    }
}
