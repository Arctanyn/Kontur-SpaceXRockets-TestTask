//
//  ISP.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 05.02.2023.
//

import Foundation

extension Rocket {
    struct ISP: Decodable {
        let seaLevel: Int
        let vacuum: Int

        enum CodingKeys: String, CodingKey {
            case seaLevel = "sea_level"
            case vacuum
        }
    }
}
