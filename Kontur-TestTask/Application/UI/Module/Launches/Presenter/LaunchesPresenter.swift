//
//  LaunchesPresenter.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 12.02.2023.
//

import Foundation

protocol LaunchesPresenter: AnyObject {
    var numberOfLaunches: Int { get }
    var rocketName: String { get }
    func fetchLaunches() async
    func viewModelForLauchCell(at indexPath: IndexPath) -> LaunchCellViewModel
    func finishFlow()
}
