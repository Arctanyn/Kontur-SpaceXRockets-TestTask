//
//  Failure.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 05.02.2023.
//

import Foundation

extension RocketLaunch {
    struct Failure: Decodable {
        let time: Int
        let altitude: Int?
        let reason: String
    }
}
