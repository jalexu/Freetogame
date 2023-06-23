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
    
    static func fromGameDetailDtoToDomain(gameDetail: GameDetail) throws -> Domain.GameDetail {
        let detail = try Domain.GameDetail(
            id: gameDetail.id,
            title: gameDetail.title,
            thumbnail: gameDetail.thumbnail,
            status: gameDetail.status,
            shortDescription: gameDetail.shortDescription,
            description: gameDetail.description,
            gameURL: gameDetail.gameURL,
            genre: gameDetail.genre,
            platform: gameDetail.platform,
            publisher: gameDetail.publisher,
            developer: gameDetail.developer,
            releaseDate: gameDetail.releaseDate,
            freetogameProfileURL: gameDetail.freetogameProfileURL,
            minimumSystemRequirements: fromMinimumSystemDtoToDomain(system: gameDetail.minimumSystemRequirements),
            screenshots: fromScreenshotDtoToDomain(screenshots: gameDetail.screenshots))
        return detail
    }
    
    private static func fromMinimumSystemDtoToDomain(system: MinimumSystemRequirements) -> Domain.MinimumSystemRequirements {
        return Domain.MinimumSystemRequirements(
            os: system.os,
            processor: system.processor,
            memory: system.memory,
            graphics: system.graphics,
            storage: system.storage)
    }
    
    private static func fromScreenshotDtoToDomain(screenshots: [Screenshot]) -> [Domain.Screenshot] {
        var screens: [Domain.Screenshot] = []
        for screen in screenshots {
            screens.append(Domain.Screenshot(id: screen.id, image: screen.image))
        }
        return screens
    }
    
    static func fromGameToGameDao(game: Domain.GameDetail) -> GameDao {
        return GameDao(id: String(game.id),
                       title: game.title,
                       thumbnail: game.thumbnail,
                       shortDescription: game.shortDescription,
                       gameURL: game.gameURL,
                       genre: game.genre,
                       platform: game.platform,
                       publisher: game.publisher,
                       developer: game.developer,
                       releaseDate: game.releaseDate,
                       freetogameProfileURL: game.freetogameProfileURL,
                       isFavorite: true)
    }
    
    static func fromGameDaoToGameDomain(game: GameDao?) throws -> Domain.Game? {
        guard let game = game else { return nil }
        return try Domain.Game(id: Int(game.id) ?? 0,
                               title: game.title,
                               thumbnail: game.thumbnail,
                               shortDescription: game.shortDescription,
                               gameURL: game.gameURL,
                               genre: game.genre,
                               platform: game.platform,
                               publisher: game.publisher,
                               developer: game.developer,
                               releaseDate: game.releaseDate,
                               freetogameProfileURL: game.freetogameProfileURL,
                               isFavorite: game.isFavorite)
    }
}
