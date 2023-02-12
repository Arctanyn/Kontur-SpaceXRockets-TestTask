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
    private var fetchLaunchesTask: Task<Void, Never>?
    
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
        
        fetchLaunchesTask = Task {
            await fetchLaunches()
        }
    }
}

//MARK: - Private methods

private extension LaunchesPresenterImpl {
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
        var launchDate = String()
        
        if let date = launch.dateLocal.convertToDate(format: "yyyy-MM-dd'T'HH:mm:ssZ") {
            launchDate = date.toString(format: "MMM d, yyyy")
        }
        
        return LaunchCellViewModel(name: launch.name, date: launchDate, success: launch.success ?? false)
    }
    
    @MainActor
    func fetchLaunches() async {
        view.startLoadingIndicator()
        do {
            let launchesData = try await rocketAPIService.getRocketLaunches()
            launches = try dataDecoder.decode(data: launchesData, to: [RocketLaunch].self)
            await filterLaunches(by: rocket.id)
            
            if launches.isEmpty {
                view.displayLaunchesAbsence()
            } else {
                view.reloadData()
            }
        } catch {
            view.showErrorAlert(description: error.localizedDescription)
        }
        view.stopLoadingIndicator()
    }
    

    func finishFlow() {
        fetchLaunchesTask?.cancel()
        coordinator.finishFlow?()
    }
}
