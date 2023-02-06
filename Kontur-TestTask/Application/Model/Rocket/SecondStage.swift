//
//  SecondStage.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 05.02.2023.
//

import Foundation

extension Rocket {
    struct SecondStage: Decodable {
        let thrust: Thrust
        let payloads: Payloads
        let reusable: Bool
        let engines: Int
        let fuelAmountTons: Double
        let burnTimeSEC: Int?

        enum CodingKeys: String, CodingKey {
            case thrust
            case payloads
            case reusable 
            case engines
            case fuelAmountTons = "fuel_amount_tons"
            case burnTimeSEC = "burn_time_sec"
        }
    }
}
