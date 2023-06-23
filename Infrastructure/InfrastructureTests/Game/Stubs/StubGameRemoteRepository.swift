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
    let gameDetail: Infrastructure.GameDetail
    
    init(games: [Infrastructure.Game] = [Infrastructure.Game]()) {
        self.games = games
    }
    
    func getGames() throws -> AnyPublisher<[Domain.Game], Error> {
        return Future<[Domain.Game], Error> { promise in
            do {
                let domainGames = try self.games.map { try GameTranslator.fromDtoToDomain(game: $0) }
                promise(.success(domainGames))
            } catch {
                promise(.failure(error))
            }
        }.eraseToAnyPublisher()
    }
    
    func getGameDatail(id: Int) throws -> AnyPublisher<Domain.GameDetail, Error> {
        return Future<Domain.GameDetail, Error> { promise in
            do {
                let domaiGameDatail = try GameTranslator.fromGameDetailDtoToDomain(gameDetail: self.gameDetail)
                promise(.success(domaiGameDatail))
            } catch {
                promise(.failure(error))
            }
        }.eraseToAnyPublisher()
    }
}
