//
//  Game.swift
//  Infrastructure
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import Foundation

struct Game: Codable {
    let id: Int
    let title: String
    let thumbnail: String
    let shortDescription: String
    let gameURL: String
    let genre: String
    let platform: String
    let publisher: String
    let developer: String
    let releaseDate: String
    let freetogameProfileURL: String

    enum CodingKeys: String, CodingKey {
        case id, title, thumbnail
        case shortDescription = "short_description"
        case gameURL = "game_url"
        case genre, platform, publisher, developer
        case releaseDate = "release_date"
        case freetogameProfileURL = "freetogame_profile_url"
    }
}
