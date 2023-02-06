//
//  CompositeFairing.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 05.02.2023.
//

import Foundation

extension Rocket {
    struct CompositeFairing: Decodable {
        let height: Diameter
        let diameter: Diameter
    }
}
