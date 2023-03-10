//
//  RocketInfoPresenterImpl.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 06.02.2023.
//

import Foundation

final class RocketInfoPresenterImpl {
    
    //MARK: Properties
    
    private var heightUnit: LenghtUnit {
        settings.getLenthUnit(forOption: .height)
    }
    
    private var diameterUnit: LenghtUnit {
        settings.getLenthUnit(forOption: .diameter)
    }
    
    private var massUnit: WeightUnit {
        settings.getWeightUnit(forOption: .mass)
    }
    
    private var payloadUnit: WeightUnit {
        settings.getWeightUnit(forOption: .payload)
    }
    
    private let rocket: Rocket
    private unowned let view: RocketViewControllerProtocol
    private let settings: Settings
    private let coordinator: RocketInfoCoordinator
    
    //MARK: - Initialization
    
    init(rocket: Rocket,
         view: RocketViewControllerProtocol,
         settings: Settings,
         coordinator: RocketInfoCoordinator) {
        self.rocket = rocket
        self.view = view
        self.settings = settings
        self.coordinator = coordinator
        addSettingsObserver()
    }
    
    //MARK: - Deinitialization
    
    deinit {
        removeSettingsObserver()
    }
}

//MARK: - Private

private extension RocketInfoPresenterImpl {
    func addSettingsObserver() {
        NotificationCenter.default.addObserver(forName: .settingsUpdate, object: nil, queue: .main) { [view] _ in
            view.reloadData(in: IndexSet(integer: RocketInfoSection.specifications.rawValue))
        }
    }
    
    func removeSettingsObserver() {
        NotificationCenter.default.removeObserver(self, name: .settingsUpdate, object: nil)
    }
    
    func makeSpecificationViewModel(for specification: RocketSpecification) -> RocketSpecificationCellViewModel {
        let name = specification.title
        var value = String()
        var unit = String()
        
        switch specification {
        case .height:
            unit = heightUnit.designation
            
            switch heightUnit {
            case .meter: value = String(rocket.height.meters ?? 0)
            case .feet: value = String(rocket.height.feet ?? 0)
            }
        case .diameter:
            unit = diameterUnit.designation
            
            switch diameterUnit {
            case .meter: value = String(rocket.diameter.meters ?? 0)
            case .feet: value = String(rocket.diameter.feet ?? 0)
            }
        case .mass:
            unit = massUnit.designation
            
            switch massUnit {
            case .kilogram: value = String(rocket.mass.kg)
            case .pound: value = String(rocket.mass.lb)
            default:
                break
            }
        case .payload:
            unit = payloadUnit.designation
            
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

extension RocketInfoPresenterImpl: RocketInfoPresenter {
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
        case .rocketHeader:
            return 1
        case .specifications:
            return RocketSpecification.count
        case .general:
            return GeneralInfo.count
        case .firstStage, .secondStage:
            return StageInfo.count
        case .button:
            return 1
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
    
    func openSettings() {
        coordinator.runSettingsFlow()
    }
    
    func openLaunches() {
        coordinator.showLaunches(rocket: rocket)
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
            info = rocket.costPerLaunch.toCurrency()
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
            unit = WeightUnit.tonne.designation
        case .burnTime:
            specification = String((rocketInfoSection == .firstStage ? rocket.firstStage.burnTimeSEC : rocket.secondStage.burnTimeSEC) ?? 0)
            unit = TimeUnit.seconds.designation
        }
        
        return RocketStageCellViewModel(title: title, specification: specification, unit: unit)
    }
}
