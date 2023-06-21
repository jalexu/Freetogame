//
//  StubGameRemoteRepository.swift
//  InfrastructureTests
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import Foundation
import Combine
@testable import Infrastructure
@testable import Domain

final class StubGameRemoteRepository: GameRemoteRepository {
    
    let games: [Infrastructure.Game]
    
    init(games: [Infrastructure.Game] = [Infrastructure.Game]()) {
        self.games = games
    }
    
    func getGames() throws -> AnyPublisher<[Domain.Game], Error> {
        return Future<[Domain.Game], Error> { promise in
            do {
                let domainMovies = try self.games.map { try GameTranslator.fromDtoToDomain(game: $0) }
                promise(.success(domainMovies))
            } catch {
                promise(.failure(error))
            }
        }.eraseToAnyPublisher()
    }
}
