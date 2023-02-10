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
    private let coordinator: RocketPagesCoordinator
    
    private var rockets = [Rocket]()
    private var launches = [RocketLaunch]()
    
    //MARK: - Initialization
    
    init(view: RocketPagesViewControllerProtocol,
         rocketAPIService: RocketAPIService,
         dataDecoder: DataDecoder,
         coordinator: RocketPagesCoordinator) {
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
            let rockets = try await dataDecoder.decode(data: rocketData, to: [Rocket].self)
            self.rockets = rockets

            await MainActor.run {
                view.stopLoadingIndicator()
            }
        } catch let error where error is HttpError {
            print(error.localizedDescription)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
 
//MARK: - RocketPagesPresenter

extension RocketPagesPresenterImpl: RocketPagesPresenter {
    @MainActor
    func fetchRocketsInfo() async {
        view.startLoadingInficator()
        await fetchRocketsData()
        coordinator.showRockets(rockets)
    }
}
