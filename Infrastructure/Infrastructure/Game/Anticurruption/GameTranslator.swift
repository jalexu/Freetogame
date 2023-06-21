//
//  GameTranslator.swift
//  Infrastructure
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import Foundation
import Domain

struct GameTranslator {
    static func fromDtoToDomain(game: Game) throws -> Domain.Game {
        let game = try Domain.Game(
            id: game.id,
            title: game.title,
            thumbnail: game.thumbnail,
            shortDescription: game.shortDescription,
            gameURL: game.gameURL,
            genre: game.genre,
            platform: game.platform,
            publisher: game.publisher,
            developer: game.developer,
            releaseDate: game.releaseDate,
            freetogameProfileURL: game.freetogameProfileURL)
        return game
    }
}
