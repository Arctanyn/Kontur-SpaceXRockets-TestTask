//
//  RocketInfoSection.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 07.02.2023.
//

//MARK: RocketInfoSection

enum RocketInfoSection: Int, CaseIterable {
    case rocketHeader
    case specifications
    case general
    case firstStage
    case secondStage
    case button
    
    var title: String? {
        switch self {
        case .firstStage:
            return "First stage"
        case .secondStage:
            return "Secong stage"
        default:
            return nil
        }
    }
}

//MARK: - RocketSpecification

enum RocketSpecification: Int, CaseIterable {
    case height
    case diameter
    case mass
    case payload
    
    var title: String {
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
}

//MARK: - GeneralInfo

enum GeneralInfo: Int, CaseIterable {
    case firstLaunch
    case country
    case launchCost
    
    var title: String {
        switch self {
        case .firstLaunch:
            return "First launch"
        case .country:
            return "Country"
        case .launchCost:
            return "Launch cost"
        }
    }
}

//MARK: - StageInfo

enum StageInfo: Int, CaseIterable {
    case enginesCount
    case fuelAmount
    case burnTime
    
    var title: String {
        switch self {
        case .enginesCount:
            return "Engines"
        case .fuelAmount:
            return "Fuel amount"
        case .burnTime:
            return "Burn time"
        }
    }
}
