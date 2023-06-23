//
//  GameDetailViewModelTests.swift
//  FreetogameTests
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 23/06/23.
//

import XCTest
import Combine
@testable import Freetogame
@testable import Infrastructure

final class GameDetailViewModelTests: XCTestCase {
    
    private var sut: GameDetailViewModel!
    private var stubGameService: StubGameService!
    private var stubGameRepository: StubGameRepository!
    private var stubGameLocalRepository: StubGameLocalRepository!
    private var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        try super.setUpWithError()
        stubGameRepository = StubGameRepository()
        stubGameService = StubGameService(gameRepository: stubGameRepository)
        stubGameLocalRepository = StubGameLocalRepository(gameDetail: createGameDetail())
        sut = GameDetailViewModel(gameService: stubGameService,
                                  gameLocalRepository: stubGameLocalRepository,
                                  idGame: 324,
                                  isFavorite: true)
    }

    override func tearDownWithError() throws {
        sut = nil
        stubGameRepository = nil
        stubGameService = nil
        stubGameLocalRepository = nil
        try super.tearDownWithError()
    }

    func test_getGameDetail_WhenIsSuccess_ThenShowGameDetail() {
        // Arrange
        let datas: String?
        let expectation = XCTestExpectation(description: "Get vehicles from API")
        
        // Act
        sut.getGameDetail()
        
        let result = XCTWaiter.wait(for: [expectation], timeout: 0.5)
        if result == XCTWaiter.Result.timedOut {
            switch sut.state {
            case .success(let data):
                datas = data?.developer
            case .loading:
                datas = nil
            case .failure(_):
                datas = nil
            }
            XCTAssertEqual(datas, "R2 Games")
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func test_saveFavoriteGame_WhenIsSuccess_ThenSave() {
        // Arrange
        let datas: String?
        let expectation = XCTestExpectation(description: "Save reaml")
        sut.getGameDetail()
        
        // Act
        sut.saveFavoriteGame()
        
        let result = XCTWaiter.wait(for: [expectation], timeout: 0.5)
        if result == XCTWaiter.Result.timedOut {
            switch sut.state {
            case .success(let data):
                datas = data?.developer
            case .loading:
                datas = nil
            case .failure(_):
                datas = nil
            }
            XCTAssertEqual(datas, "R2 Games")
        } else {
            XCTFail("Delay interrupted")
        }
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
