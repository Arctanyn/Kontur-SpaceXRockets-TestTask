//
//  RocketInfoPresenter.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 06.02.2023.
//

import Foundation

protocol RocketInfoPresenter: AnyObject {
    var rocketName: String { get }
    var numberOfSections: Int { get }
    func numberOfItems(in section: Int) -> Int
    func sectionTypeForSection(at index: Int) -> RocketInfoSection?
    
    func openSettings()
    func openLaunches()
    
    func viewModelForRocketHeader() -> RocketHeaderCellViewModel
    func viewModelForSpecificationCell(at indexPath: IndexPath) -> RocketSpecificationCellViewModel?
    func viewModelForGeneralInfoCell(at indexPath: IndexPath) -> RocketInfoCellViewModel?
    func viewModelForStageInfoCell(at indexPath: IndexPath) -> RocketStageCellViewModel?
}
 
