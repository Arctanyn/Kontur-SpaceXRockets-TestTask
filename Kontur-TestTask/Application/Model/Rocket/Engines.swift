//
//  Engines.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 05.02.2023.
//

import Foundation

extension Rocket {
    struct Engines: Decodable {
        let isp: ISP
        let thrustSeaLevel: Thrust
        let thrustVacuum: Thrust
        let number: Int
        let type: String
        let version: String
        let layout: String?
        let engineLossMax: Int?
        let propellant1: String
        let propellant2: String
        let thrustToWeight: Double

        enum CodingKeys: String, CodingKey {
            case isp
            case thrustSeaLevel = "thrust_sea_level"
            case thrustVacuum = "thrust_vacuum"
            case number
            case type
            case version
            case layout
            case engineLossMax = "engine_loss_max"
            case propellant1 = "propellant_1"
            case propellant2 = "propellant_2"
            case thrustToWeight = "thrust_to_weight"
        }
    }
}
