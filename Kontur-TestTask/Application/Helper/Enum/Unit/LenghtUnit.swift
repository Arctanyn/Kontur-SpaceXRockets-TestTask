//
//  LenghtUnit.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 10.02.2023.
//

enum LenghtUnit: Unit {
    case meter
    case feet
    
    var designation: String {
        switch self {
        case .meter:
            return "m"
        case .feet:
            return "ft"
        }
    }
}
