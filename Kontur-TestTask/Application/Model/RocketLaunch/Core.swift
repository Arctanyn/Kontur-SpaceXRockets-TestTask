//
//  Core.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 05.02.2023.
//

import Foundation

extension RocketLaunch {
    struct Core: Decodable {
        let core: String?
        let flight: Int?
        let gridfins: Bool?
        let legs: Bool?
        let reused: Bool?
        let landingAttempt: Bool?
        let landingSuccess: Bool?
        let landingType: String?
        let landpad: String?

        enum CodingKeys: String, CodingKey {
            case core
            case flight
            case gridfins
            case legs
            case reused
            case landingAttempt = "landing_attempt"
            case landingSuccess = "landing_success"
            case landingType = "landing_type"
            case landpad
        }
    }
}
