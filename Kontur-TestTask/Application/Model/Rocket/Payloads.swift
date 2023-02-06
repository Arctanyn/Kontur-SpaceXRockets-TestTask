//
//  Payloads.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 05.02.2023.
//

import Foundation

extension Rocket {
    struct Payloads: Decodable {
        let compositeFairing: CompositeFairing
        let option1: String

        enum CodingKeys: String, CodingKey {
            case compositeFairing = "composite_fairing"
            case option1 = "option_1"
        }
    }
}
