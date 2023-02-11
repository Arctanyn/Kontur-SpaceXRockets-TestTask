//
//  RocketPresenterImpl.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 06.02.2023.
//

import Foundation

final class RocketPresenterImpl {
    
    //MARK: Properties
    
    private var heightUnit: LenghtUnit {
        return .meter
    }
    
    private var diameterUnit: LenghtUnit {
        return .meter
    }
    
    private var massUnit: WeightUnit {
        return .kilogram
    }
    
    private var payloadUnit: WeightUnit {
        return .kilogram
    }
    
    private let rocket: Rocket
    private unowned let view: RocketViewControllerProtocol
    
    //MARK: - Initialization
    
    init(rocket: Rocket,
         view: RocketViewControllerProtocol) {
        self.rocket = rocket
        self.view = view
    }
}

//MARK: - Private

private extension RocketPresenterImpl {
    func makeSpecificationViewModel(for specification: RocketSpecification) -> RocketSpecificationCellViewModel {
        let name = specification.title
        var value = String()
        var unit = String()
        
        switch specification {
        case .height:
            unit = heightUnit.rawValue
            
            switch heightUnit {
            case .meter: value = String(rocket.height.meters ?? 0)
            case .feet: value = String(rocket.height.feet ?? 0)
            }
        case .diameter:
            unit = diameterUnit.rawValue
            
            switch diameterUnit {
            case .meter: value = String(rocket.diameter.meters ?? 0)
            case .feet: value = String(rocket.diameter.feet ?? 0)
            }
        case .mass:
            unit = massUnit.rawValue
            
            switch massUnit {
            case .kilogram: value = String(rocket.mass.kg)
            case .pound: value = String(rocket.mass.lb)
            default:
                break
            }
        case .payload:
            unit = payloadUnit.rawValue
            
            switch payloadUnit {
            case .kilogram: value = String(rocket.payloadWeights.first?.kg ?? 0)
            case .pound: value = String(rocket.payloadWeights.first?.lb ?? 0)
            default:
                break
            }
        }
        
        return RocketSpecificationCellViewModel(value: value, specificationName: name, unit: unit)
    }
}

//MARK: - RocketPresenter

extension RocketPresenterImpl: RocketPresenter {
    var rocketName: String {
        rocket.name
    }
    
    var numberOfSections: Int {
        return RocketInfoSection.count
    }
    
    func numberOfItems(in section: Int) -> Int {
        guard let rocketInfoSection = sectionTypeForSection(at: section) else {
            fatalError()
        }
        
        switch rocketInfoSection {
        case .rocketImage:
            return 1
        case .specifications:
            return RocketSpecification.count
        case .general:
            return GeneralInfo.count
        case .firstStage, .secondStage:
            return StageInfo.count
        }
    }
    
    func sectionTypeForSection(at index: Int) -> RocketInfoSection? {
        RocketInfoSection(rawValue: index)
    }
    
    func viewModelForRocketHeader() -> RocketHeaderCellViewModel {
        return RocketHeaderCellViewModel(
            rocketName: self.rocketName,
            imageURL: URL(string: rocket.flickrImages.first ?? "")
        )
    }
    
    func viewModelForSpecificationCell(at indexPath: IndexPath) -> RocketSpecificationCellViewModel? {
        guard let specification = RocketSpecification(rawValue: indexPath.item) else {
            return nil
        }
        return makeSpecificationViewModel(for: specification)
    }
    
    func viewModelForGeneralInfoCell(at indexPath: IndexPath) -> RocketInfoCellViewModel? {
        guard let generalInfo = GeneralInfo(rawValue: indexPath.item) else {
            return nil
        }
        
        var info = String()
        
        switch generalInfo {
        case .firstLaunch:
            if let date = rocket.firstFlight.convertToDate(format: "yyyy-MM-dd") {
                info = date.toString(format: "MMM d, yyyy")
            }
        case .country:
            info = rocket.country
        case .launchCost:
            info = "$\(rocket.costPerLaunch)"
        }
        
        return RocketInfoCellViewModel(title: generalInfo.title, info: info)
    }
    
    func viewModelForStageInfoCell(at indexPath: IndexPath) -> RocketStageCellViewModel? {
        guard
            let rocketInfoSection = sectionTypeForSection(at: indexPath.section),
            rocketInfoSection == .firstStage || rocketInfoSection == .secondStage,
            let stageInfo = StageInfo(rawValue: indexPath.item)
        else {
            return nil
        }
        
        let title = stageInfo.title
        var specification = String()
        var unit: String? = nil
        
        switch stageInfo {
        case .enginesCount:
            specification = String(rocket.engines.number)
        case .fuelAmount:
            specification = String(rocketInfoSection == .firstStage ? rocket.firstStage.fuelAmountTons : rocket.secondStage.fuelAmountTons)
            unit = WeightUnit.tonne.rawValue
        case .burnTime:
            specification = String((rocketInfoSection == .firstStage ? rocket.firstStage.burnTimeSEC : rocket.secondStage.burnTimeSEC) ?? 0)
            unit = TimeUnit.seconds.rawValue
        }
        
        return RocketStageCellViewModel(title: title, specification: specification, unit: unit)
    }
}
