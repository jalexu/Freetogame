//
//  GameTests.swift
//  DomainTests
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import XCTest
@testable import Domain

final class GameTests: XCTestCase {
    
    struct InnerConstant {
        static let id = 457
        static let title = "The Third Age"
        static let thumbnail = "https://www.freetogame.com/g/457/thumbnail.jpg"
        static let short_description = "A free-to-play browser-based Strategy MMO game focused on story-based PvE gameplay!"
        static let game_url = "https://www.freetogame.com/open/the-third-age"
        static let genre = "Strategy"
        static let platform = "Web Browser"
        static let publisher = "R2 Games"
        static let developer = "R2 Games"
        static let release_date = "2019-04-29"
        static let freetogame_profile_url = "https://www.freetogame.com/the-third-age"
    }
    
    func test_createGame_withValidateData() throws {
        // Arrange
        var game: Game
        
        // Act
        game = try Game(id: InnerConstant.id,
                        title: InnerConstant.title,
                        thumbnail: InnerConstant.thumbnail,
                        shortDescription: InnerConstant.thumbnail,
                        gameURL: InnerConstant.game_url,
                        genre: InnerConstant.genre,
                        platform: InnerConstant.platform,
                        publisher: InnerConstant.publisher,
                        developer: InnerConstant.developer,
                        releaseDate: InnerConstant.release_date,
                        freetogameProfileURL: InnerConstant.freetogame_profile_url)
        // Assert
        XCTAssertEqual(game.id, InnerConstant.id)
        XCTAssertEqual(game.title, InnerConstant.title)
        XCTAssertEqual(game.gameURL, InnerConstant.game_url)
        XCTAssertEqual(game.genre, InnerConstant.genre)
        XCTAssertEqual(game.freetogameProfileURL, InnerConstant.freetogame_profile_url)
    }
    
    func test_createGameWhenIsNegativeNumber_ThenThrowException() {
        // Arrange
        let id = -4
        
        // Act
        XCTAssertThrowsError(
            try Game(id: id,
                     title: InnerConstant.title,
                     thumbnail: InnerConstant.thumbnail,
                     shortDescription: InnerConstant.thumbnail,
                     gameURL: InnerConstant.game_url,
                     genre: InnerConstant.genre,
                     platform: InnerConstant.platform,
                     publisher: InnerConstant.publisher,
                     developer: InnerConstant.developer,
                     releaseDate: InnerConstant.release_date,
                     freetogameProfileURL: InnerConstant.freetogame_profile_url)
            
        ) { error in
            // Assert
            XCTAssertEqual(error as? GameException, GameException.negativeNumber)
        }
    }
    
    func test_createGameWhenTitleIsEmpty_ThenThrowsEmptyParamException() {
        // Arrange
        let title = ""
        // Act
        XCTAssertThrowsError(
            try Game(id: InnerConstant.id,
                     title: title,
                     thumbnail: InnerConstant.thumbnail,
                     shortDescription: InnerConstant.thumbnail,
                     gameURL: InnerConstant.game_url,
                     genre: InnerConstant.genre,
                     platform: InnerConstant.platform,
                     publisher: InnerConstant.publisher,
                     developer: InnerConstant.developer,
                     releaseDate: InnerConstant.release_date,
                     freetogameProfileURL: InnerConstant.freetogame_profile_url)
        ) { error in
            // Assert
            XCTAssertEqual(error as? EmptyParamException, EmptyParamException.emptyField(param: "title"))
        }
    }
    
    func test_createGameWhenShortDescriptionIsEmpty_ThenThrowsEmptyParamException() {
        // Arrange
        let shortDescription = ""
        // Act
        XCTAssertThrowsError(
            try Game(id: InnerConstant.id,
                     title: InnerConstant.title,
                     thumbnail: InnerConstant.thumbnail,
                     shortDescription: shortDescription,
                     gameURL: InnerConstant.game_url,
                     genre: InnerConstant.genre,
                     platform: InnerConstant.platform,
                     publisher: InnerConstant.publisher,
                     developer: InnerConstant.developer,
                     releaseDate: InnerConstant.release_date,
                     freetogameProfileURL: InnerConstant.freetogame_profile_url)
        ) { error in
            // Assert
            XCTAssertEqual(error as? EmptyParamException, EmptyParamException.emptyField(param: "shortDescription"))
        }
    }
    
    func test_createGameWhenGameUrlIsEmpty_ThenThrowsEmptyParamException() {
        // Arrange
        let gameUrl = ""
        // Act
        XCTAssertThrowsError(
            try Game(id: InnerConstant.id,
                     title: InnerConstant.title,
                     thumbnail: InnerConstant.thumbnail,
                     shortDescription: InnerConstant.short_description,
                     gameURL: gameUrl,
                     genre: InnerConstant.genre,
                     platform: InnerConstant.platform,
                     publisher: InnerConstant.publisher,
                     developer: InnerConstant.developer,
                     releaseDate: InnerConstant.release_date,
                     freetogameProfileURL: InnerConstant.freetogame_profile_url)
        ) { error in
            // Assert
            XCTAssertEqual(error as? EmptyParamException, EmptyParamException.emptyField(param: "gameUrl"))
        }
    }
}
