//
//  RocketInfoSection.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 07.02.2023.
//

enum RocketInfoSection: Int, CaseIterable {
    case rocketImage
    case specifications
    case general
    case firstStage
    case secondStage
    
    var title: String? {
        switch self {
        case .rocketImage, .specifications, .general:
            return nil
        case .firstStage:
            return "First stage"
        case .secondStage:
            return "Secong stage"
        }
    }
}

//MARK: - RocketSpecification

extension RocketInfoSection {
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
}

//MARK: - GeneralInfo

extension RocketInfoSection {
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
}

//MARK: - StageInfo

extension RocketInfoSection {
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
}
