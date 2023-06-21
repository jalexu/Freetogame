//
//  Game.swift
//  Domain
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import Foundation

import Foundation

public struct Game: Identifiable {
    
    public let id: Int
    public let title: String
    public let thumbnail: String
    public let shortDescription: String
    public let gameURL: String
    public let genre: String
    public let platform: String
    public let publisher: String
    public let developer: String
    public let releaseDate: String
    public let freetogameProfileURL: String
    
    public init(
        id: Int,
        title: String,
        thumbnail: String,
        shortDescription: String,
        gameURL: String,
        genre: String,
        platform: String,
        publisher: String,
        developer: String,
        releaseDate: String,
        freetogameProfileURL: String) throws {
        self.id = id
        self.title = title
        self.thumbnail = thumbnail
        self.shortDescription = shortDescription
        self.gameURL = gameURL
        self.genre = genre
        self.platform = platform
        self.publisher = publisher
        self.developer = developer
        self.releaseDate = releaseDate
        self.freetogameProfileURL = freetogameProfileURL
        try validateFields()
    }
    
    private func validateFields() throws {
        guard self.id > 0 else {
            throw GameException.negativeNumber
        }
        
        try ArgumentValidator.validateEmptyParam(value: title, param: "title")
        try ArgumentValidator.validateEmptyParam(value: shortDescription, param: "shortDescription")
        try ArgumentValidator.validateEmptyParam(value: gameURL, param: "gameUrl")
    }
}
