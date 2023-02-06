//
//  PayloadWeight.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 05.02.2023.
//

import Foundation

extension Rocket {
    struct PayloadWeight: Decodable {
        let id: String
        let name: String
        let kg: Int
        let lb: Int
    }
}

