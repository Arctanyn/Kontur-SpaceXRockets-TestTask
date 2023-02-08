//
//  RocketPresenter.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 06.02.2023.
//

import Foundation

protocol RocketPresenter: AnyObject {
    var numberOfSections: Int { get }
    func numberOfItems(in section: Int) -> Int
    func sectionTypeForSection(at index: Int) -> RocketInfoSection?
}
 
