//
//  Fairings.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 05.02.2023.
//

import Foundation

extension RocketLaunch {
    struct Fairings: Decodable {
        let reused: Bool?
        let recoveryAttempt: Bool?
        let recovered: Bool?
        let ships: [String]

        enum CodingKeys: String, CodingKey {
            case reused
            case recoveryAttempt = "recovery_attempt"
            case recovered
            case ships
        }
    }
}
