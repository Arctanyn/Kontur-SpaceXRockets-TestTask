//
//  RocketLaunch.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 05.02.2023.
//

import Foundation

struct RocketLaunch: Decodable {
    let fairings: Fairings?
    let links: Links
    let staticFireDateUTC: String?
    let staticFireDateUnix: Int?
    let net: Bool
    let window: Int?
    let rocket: String
    let success: Bool?
    let failures: [Failure]
    let details: String?
    let crew: [String]
    let ships: [String]
    let capsules: [String]
    let payloads: [String]
    let launchpad: String
    let flightNumber: Int
    let name: String
    let dateUTC: String
    let dateUnix: Int
    let dateLocal: String
    let datePrecision: String
    let upcoming: Bool
    let cores: [Core]
    let autoUpdate: Bool
    let tbd: Bool
    let launchLibraryID: String?
    let id: String

    enum CodingKeys: String, CodingKey {
        case fairings
        case links
        case staticFireDateUTC = "static_fire_date_utc"
        case staticFireDateUnix = "static_fire_date_unix"
        case net
        case window
        case rocket
        case success
        case failures
        case details
        case crew
        case ships
        case capsules
        case payloads
        case launchpad
        case flightNumber = "flight_number"
        case name
        case dateUTC = "date_utc"
        case dateUnix = "date_unix"
        case dateLocal = "date_local"
        case datePrecision = "date_precision"
        case upcoming
        case cores
        case autoUpdate = "auto_update"
        case tbd
        case launchLibraryID = "launch_library_id"
        case id
    }
}
