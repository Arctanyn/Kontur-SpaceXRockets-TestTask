//
//  RocketAPIService.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 05.02.2023.
//

import Foundation

protocol RocketAPIService {
    func getRockets() async throws -> Data
    func getRocketLaunches() async throws -> Data
}
