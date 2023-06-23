//
//  GameDetail.swift
//  Domain
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 22/06/23.
//

public struct GameDetail: Codable, Equatable, Identifiable {
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
    public var isfavorite: Bool
    
    public init(
        id: Int,
        title: String,
        thumbnail: String,
        status: String,
        shortDescription: String,
        description: String,
        gameURL: String,
        genre: String,
        platform: String,
        publisher: String,
        developer: String,
        releaseDate: String,
        freetogameProfileURL: String,
        minimumSystemRequirements: MinimumSystemRequirements,
        screenshots: [Screenshot],
        isfavorite: Bool = false) throws {
            self.id = id
            self.title = title
            self.thumbnail = thumbnail
            self.status = status
            self.shortDescription = shortDescription
            self.description = description
            self.gameURL = gameURL
            self.genre = genre
            self.platform = platform
            self.publisher = publisher
            self.developer = developer
            self.releaseDate = releaseDate.convertToDateFormat()
            self.freetogameProfileURL = freetogameProfileURL
            self.minimumSystemRequirements = minimumSystemRequirements
            self.screenshots = screenshots
            self.isfavorite = isfavorite
            try validateFields()
        }
    
    private func validateFields() throws {
        guard self.id > 0 else {
            throw GameException.negativeNumber
        }
    }
}

// MARK: - MinimumSystemRequirements
public struct MinimumSystemRequirements: Codable, Equatable {
    public let os, processor, memory, graphics: String
    public let storage: String
    
    public init(os: String, processor: String, memory: String, graphics: String, storage: String) {
        self.os = os
        self.processor = processor
        self.memory = memory
        self.graphics = graphics
        self.storage = storage
    }
}

// MARK: - Screenshot
public struct Screenshot: Codable, Equatable, Hashable {
    public let id: Int
    public let image: String
    
    public init(id: Int, image: String) {
        self.id = id
        self.image = image
    }
}
