//
//  Reddit.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 05.02.2023.
//

import Foundation

extension RocketLaunch {
    struct Reddit: Decodable {
        let campaign: String?
        let launch: String?
        let media: String?
        let recovery: String?
    }
}
