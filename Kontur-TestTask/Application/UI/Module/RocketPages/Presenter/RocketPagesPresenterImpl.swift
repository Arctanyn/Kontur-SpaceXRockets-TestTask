//
//  RocketPagesPresenterImpl.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 08.02.2023.
//

import Foundation

final class RocketPagesPresenterImpl {
    
    //MARK: Properties
    
    unowned private let view: RocketPagesViewControllerProtocol
    private let rocketAPIService: RocketAPIService
    private let dataDecoder: DataDecoder
    private let coordinator: ApplicationCoordinatorProtocol

    private var rocketsLaunches: [Rocket: [RocketLaunch]] = [:]
    
    //MARK: - Initialization
    
    init(view: RocketPagesViewControllerProtocol,
         rocketAPIService: RocketAPIService,
         dataDecoder: DataDecoder,
         coordinator: ApplicationCoordinatorProtocol) {
        self.view = view
        self.rocketAPIService = rocketAPIService
        self.dataDecoder = dataDecoder
        self.coordinator = coordinator
        
        Task {
            await fetchRocketsInfo()
        }
    }
}

//MARK: - Private methods

private extension RocketPagesPresenterImpl {
    func fetchRocketsData() async {
        do {
            async let rocketData = try rocketAPIService.getRockets()
            async let launchesData = try rocketAPIService.getRocketLaunches()
            
            let rockets = try await dataDecoder.decode(data: rocketData, to: [Rocket].self)
            let launches = try await dataDecoder.decode(data: launchesData, to: [RocketLaunch].self)
            
            await filterLaunches(with: launches, rockets: rockets)
        } catch let error where error is HttpError {
            print(error.localizedDescription)
        } catch {
            fatalError()
        }
    }
    
    func filterLaunches(with launches: [RocketLaunch], rockets: [Rocket]) async {
        await withTaskGroup(of: Void.self) { [weak self] group in
            guard let self else { return }
            for rocket in rockets {
                group.addTask {
                    await self.setRocketLaunches(launches, for: rocket)
                }
            }
        }
    }
    
    func setRocketLaunches(_ launches: [RocketLaunch], for rocket: Rocket) async {
        rocketsLaunches[rocket] = launches.filter { $0.rocket == rocket.id }
    }
}
 
//MARK: - RocketPagesPresenter

extension RocketPagesPresenterImpl: RocketPagesPresenter {
    @MainActor
    func fetchRocketsInfo() async {
        await fetchRocketsData()
        coordinator.showRockets(with: rocketsLaunches)
    }
}
