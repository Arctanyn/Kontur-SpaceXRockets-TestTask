//
//  TimeUnit.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 10.02.2023.
//

enum TimeUnit: Unit {
    case seconds
    
    var designation: String {
        switch self {
        case .seconds:
            return "sec"
        }
    }
}
