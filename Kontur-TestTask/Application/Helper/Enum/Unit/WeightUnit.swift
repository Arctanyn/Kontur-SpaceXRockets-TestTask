//
//  WeightUnit.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 10.02.2023.
//

enum WeightUnit: Unit {
    case kilogram
    case pound
    case tonne
    
    var designation: String {
        switch self {
        case .kilogram:
            return "kg"
        case .pound:
            return "lb"
        case .tonne:
            return "ton"
        }
    }
}
