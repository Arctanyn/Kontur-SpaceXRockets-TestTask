//
//  RocketPresenterImpl.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 06.02.2023.
//

import Foundation

final class RocketPresenterImpl {
    
    //MARK: Properties
    
    private let rocket: Rocket
    private unowned let view: RocketViewControllerProtocol
    private let rocketAPIService: RocketAPIService
    
    //MARK: - Initialization
    
    init(rocket: Rocket, view: RocketViewControllerProtocol, rocketAPIService: RocketAPIService) {
        self.rocket = rocket
        self.view = view
        self.rocketAPIService = rocketAPIService
        self.view.reloadData()
    }
}

//MARK: - Private

private extension RocketPresenterImpl {
    
}

extension RocketPresenterImpl: RocketPresenter {
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
            return RocketInfoSection.RocketSpecification.count
        case .general:
            return RocketInfoSection.GeneralInfo.count
        case .firstStage, .secondStage:
            return RocketInfoSection.StageInfo.count
        }
    }
    
    func sectionTypeForSection(at index: Int) -> RocketInfoSection? {
        RocketInfoSection(rawValue: index)
    }
}
