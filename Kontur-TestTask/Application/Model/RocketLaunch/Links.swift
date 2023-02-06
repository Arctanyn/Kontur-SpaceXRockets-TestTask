//
//  Links.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 05.02.2023.
//

import Foundation

extension RocketLaunch {
    struct Links: Decodable {
        let patch: Patch
        let reddit: Reddit
        let flickr: Flickr
        let presskit: String?
        let webcast: String?
        let youtubeID: String?
        let article: String?
        let wikipedia: String?

        enum CodingKeys: String, CodingKey {
            case patch
            case reddit
            case flickr
            case presskit
            case webcast
            case youtubeID = "youtube_id"
            case article
            case wikipedia
        }
    }
}
