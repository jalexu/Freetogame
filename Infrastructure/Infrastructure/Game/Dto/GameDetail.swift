//
//  GameDetail.swift
//  Infrastructure
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 22/06/23.
//

public struct GameDetail: Codable {
    public let id: Int
    public let title: String
    public let thumbnail: String
    public let status, shortDescription, description: String
    public let gameURL: String
    public let genre, platform, publisher, developer: String
    public let releaseDate: String
    public let freetogameProfileURL: String
    public let minimumSystemRequirements: MinimumSystemRequirements
    public let screenshots: [Screenshot]

    enum CodingKeys: String, CodingKey {
        case id, title, thumbnail, status
        case shortDescription = "short_description"
        case description
        case gameURL = "game_url"
        case genre, platform, publisher, developer
        case releaseDate = "release_date"
        case freetogameProfileURL = "freetogame_profile_url"
        case minimumSystemRequirements = "minimum_system_requirements"
        case screenshots
    }
}

// MARK: - MinimumSystemRequirements
public struct MinimumSystemRequirements: Codable {
    public let os, processor, memory, graphics: String
    public let storage: String
}

// MARK: - Screenshot
public struct Screenshot: Codable {
    public let id: Int
    public let image: String
}
