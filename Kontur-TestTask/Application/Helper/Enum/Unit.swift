//
//  Unit.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 07.02.2023.
//

enum Unit {
    case meter
    case feet
    case kilogram
    case pound
    case tonne
    
    var name: String {
        switch self {
        case .meter:
            return "m"
        case .feet:
            return "ft"
        case .kilogram:
            return "kg"
        case .pound:
            return "lb"
        case .tonne:
            return "ton"
        }
    }
}
