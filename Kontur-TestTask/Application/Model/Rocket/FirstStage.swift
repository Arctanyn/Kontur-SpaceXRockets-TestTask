//
//  FirstStage.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 05.02.2023.
//

import Foundation

extension Rocket {
    struct FirstStage: Decodable {
        let thrustSeaLevel: Thrust
        let thrustVacuum: Thrust
        let reusable: Bool
        let engines: Int
        let fuelAmountTons: Double
        let burnTimeSEC: Int?

        enum CodingKeys: String, CodingKey {
            case thrustSeaLevel = "thrust_sea_level"
            case thrustVacuum = "thrust_vacuum"
            case reusable
            case engines
            case fuelAmountTons = "fuel_amount_tons"
            case burnTimeSEC = "burn_time_sec"
        }
    }
}
