//
//  StubGameRepository.swift
//  FreetogameTests
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 23/06/23.
//

import Foundation
import Combine
@testable import Domain

struct StubGameRepository: GameRepository {
    var games: [Game] = []
    var gameDetail = try? GameDetail(
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
    
    func getGames() -> AnyPublisher<[Domain.Game], Error> {
        return Future<[Domain.Game], Error> { promise in
            promise(.success(self.games))
        }.eraseToAnyPublisher()
    }
    
    func getGameDetail(id: Int) -> AnyPublisher<Domain.GameDetail, Error> {
        return Future<Domain.GameDetail, Error> { promise in
            promise(.success(self.gameDetail!))
        }.eraseToAnyPublisher()
    }
    
}
