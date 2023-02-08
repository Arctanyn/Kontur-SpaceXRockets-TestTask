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
    
    private var rockets = [Rocket]()
    private var launches = [RocketLaunch]()
    
    //MARK: - Initialization
    
    init(view: RocketPagesViewControllerProtocol, rocketAPIService: RocketAPIService) {
        self.view = view
        self.rocketAPIService = rocketAPIService
    }
}

//MARK: - Private methods

private extension RocketPagesPresenterImpl {
    func fetchRocketsData() async {
        
    }
}
 
//MARK: - RocketPagesPresenter

extension RocketPagesPresenterImpl: RocketPagesPresenter {
    func fetchRocketsInfo() {
        
    }
}
