//
//  GameProxyTests.swift
//  InfrastructureTests
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import XCTest
import Combine
@testable import Infrastructure
@testable import Domain

final class GameProxyTests: XCTestCase {
    
    private var gameRemoteRepository: GameRemoteRepository!
    private var networkVerify: StubNetworkVerify!
    private var stubGameRemoteRepository: StubGameRemoteRepository!
    private var stubRealmManager: StubRealmManager!
    private var stub: GameProxy!
    private var cancellable: AnyCancellable?

    override func setUpWithError() throws {
        try super.setUpWithError()
        gameRemoteRepository = StubGameRemoteRepository(gameDetail: createGameDetail())
        networkVerify = StubNetworkVerify()
        stubRealmManager = StubRealmManager()
        stub = GameProxy(gameRemoteRepository: gameRemoteRepository,
                         networkVerify: networkVerify,
                         gameLocalRepository: StubGameLocalRepository(
                            games: [],
                            gameDetail: createGameDetail()))
    }

    override func tearDownWithError() throws {
        stub = nil
        networkVerify = nil
        gameRemoteRepository = nil
        try super.tearDownWithError()
    }

    func test_getGames_whenThereIsInternetConnection_ThenResultFromRemote() throws {
        // Arrange
        let games = try [createGame()]
        networkVerify.isConnected = true
        
        // Act
        cancellable = stub.getGames().sink(receiveCompletion: { completion in
            guard case .failure(let error) = completion else { return }
            XCTFail(error.localizedDescription)
        }, receiveValue: { movies in
            // Assert
            XCTAssertNotNil(movies)
        })
        
        cancellable?.cancel()
    }
    
    func test_getGames_whenThereIsNoInternetConnection_ThenResultFromRemoteDontExecute() throws {
        // Arrange
        let games = try [createGame()]
        networkVerify.isConnected = false
        
        // Act
        cancellable = stub.getGames().sink(receiveCompletion: { completion in
            guard case .failure(let error) = completion else { return }
            // Assert
            XCTAssertTrue(error is TechnicalException)
        }, receiveValue: { movies in
            XCTFail("Unexpected movies")
        })
        
        cancellable?.cancel()
    }
    
    private func createGame() throws -> Domain.Game {
        try Domain.Game(id: 457,
                        title: "The Third Age",
                        thumbnail: "https://www.freetogame.com/g/457/thumbnail.jpg",
                        shortDescription: "A free-to-play browser-based Strategy MMO game focused on story-based PvE gameplay!",
                        gameURL: "https://www.freetogame.com/open/the-third-age",
                        genre: "Strategy",
                        platform: "Web Browser",
                        publisher: "R2 Games",
                        developer: "R2 Games",
                        releaseDate: "2019-04-29",
                        freetogameProfileURL: "https://www.freetogame.com/the-third-age")
    }
    
    private func createGameDetail() -> Infrastructure.GameDetail {
        return Infrastructure.GameDetail(
            id: 457,
            title: "The Third Age",
            thumbnail: "https://www.freetogame.com/g/457/thumbnail.jpg",
            status: "good",
            shortDescription: "A free-to-play browser-based Strategy MMO game focused on story-based PvE gameplay!",
            description: "description",
            gameURL: "https://www.freetogame.com/open/the-third-age",
            genre: "Strategy",
            platform: "Web Browser",
            publisher: "R2 Games",
            developer: "R2 Games",
            releaseDate: "2019-04-29",
            freetogameProfileURL: "https://www.freetogame.com/the-third-age",
            minimumSystemRequirements: MinimumSystemRequirements(
                os: "os",
                processor: "processor",
                memory: "memory",
                graphics: "graphics",
                storage: "storage"),
            screenshots: [])
    }

}
