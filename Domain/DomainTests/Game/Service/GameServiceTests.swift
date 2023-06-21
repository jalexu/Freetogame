//
//  GameServiceTests.swift
//  DomainTests
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import XCTest
import Combine
@testable import Domain

final class GameServiceTests: XCTestCase {
    private var cancellable: AnyCancellable?
    private var stubGameRepository: StubGameRepository!
    private var sub: GameService!

    override func setUpWithError() throws {
        try super.setUpWithError()
        stubGameRepository = StubGameRepository()
        sub = GameService(gameRepository: stubGameRepository)
    }

    override func tearDownWithError() throws {
        sub = nil
        stubGameRepository = nil
        try super.tearDownWithError()
    }

    func test_getGames_whenIsInvoked_TheGamesResponse() throws {
        // Arrange
        let expectation = XCTestExpectation(description: "Games received")
        stubGameRepository.games.append(try Game(
            id: 457,
            title: "The Third Age",
            thumbnail: "https://www.freetogame.com/g/457/thumbnail.jpg",
            shortDescription: "A free-to-play browser-based Strategy MMO game focused on story-based PvE gameplay!",
            gameURL: "https://www.freetogame.com/open/the-third-age",
            genre: "Strategy",
            platform: "Web Browser",
            publisher: "R2 Games",
            developer: "R2 Games",
            releaseDate: "2019-04-29",
            freetogameProfileURL: "https://www.freetogame.com/the-third-age"))
        sub = GameService(gameRepository: stubGameRepository)
        
        // Act
        cancellable = sub.getGames()
            .sink(receiveCompletion: { completion in
                guard case .failure(let error) = completion else { return }
                XCTFail(error.localizedDescription)
            }, receiveValue: { games in
                // Assert
                XCTAssertFalse(games.isEmpty)
                expectation.fulfill()
            })
        
        wait(for: [expectation], timeout: 0.5)
        
        cancellable?.cancel()
    }
    
    func test_getGames_whenApiReturnEmpty_TheThrowException() throws {
        // Arrange
        let expectation = XCTestExpectation(description: "Games throw exception empty")
        
        // Act
        cancellable = sub.getGames()
            .sink(receiveCompletion: { completion in
                guard case .failure(let error) = completion else { return }
                // Assert
                XCTAssertTrue(error is GameException)
                expectation.fulfill()
            }, receiveValue: { _ in
                XCTFail("recive games")
            })
        
        wait(for: [expectation], timeout: 0.5)
        
        cancellable?.cancel()
    }


}
