//
//  LaunchesPresenterImpl.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 12.02.2023.
//

import Foundation

final class LaunchesPresenterImpl {

    //MARK: Properties
    
    unowned private let view: LaunchesViewControllerProtocol
    private let rocket: Rocket
    private let rocketAPIService: RocketAPIService
    private let dataDecoder: DataDecoder
    private let coordinator: LaunchesCoordinator
    
    private var launches = [RocketLaunch]()
    
    //MARK: - Initialization
    
    init(view: LaunchesViewControllerProtocol,
         rocket: Rocket,
         rocketAPIService: RocketAPIService,
         dataDecoder: DataDecoder,
         coordinator: LaunchesCoordinator) {
        self.view = view
        self.rocket = rocket
        self.rocketAPIService = rocketAPIService
        self.dataDecoder = dataDecoder
        self.coordinator = coordinator
        
        Task {
            await fetchLaunches()
        }
    }
}

//MARK: - Private methods

private extension LaunchesPresenterImpl {
    @MainActor
    func fetchLaunches() async {
        do {
            let launchesData = try await rocketAPIService.getRocketLaunches()
            launches = try dataDecoder.decode(data: launchesData, to: [RocketLaunch].self)
            await filterLaunches(by: rocket.id)
            view.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func filterLaunches(by rocketId: String) async {
        self.launches = launches.filter { $0.rocket == rocket.id }
    }
}

//MARK: - LaunchesPresenter

extension LaunchesPresenterImpl: LaunchesPresenter {
    var numberOfLaunches: Int { launches.count }
    
    var rocketName: String { rocket.name }
    
    func viewModelForLauchCell(at indexPath: IndexPath) -> LaunchCellViewModel {
        let launch = launches[indexPath.item]
        return LaunchCellViewModel(name: launch.name, date: launch.dateLocal, success: launch.success ?? false)
    }
    
    func finishFlow() {
        coordinator.finishFlow?()
    }
}
