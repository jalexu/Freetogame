//
//  StubGameLocalRepository.swift
//  InfrastructureTests
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 23/06/23.
//

import Foundation
import Combine
@testable import Infrastructure
@testable import Domain

final class StubGameLocalRepository: GameLocalRepository {
    let games: [Infrastructure.Game]
    let gameDetail: Infrastructure.GameDetail
    
    init(games: [Infrastructure.Game] = [Infrastructure.Game](),
         gameDetail: Infrastructure.GameDetail) {
        self.games = games
        self.gameDetail = gameDetail
    }
    
    func saveFavoriteGame(game: Domain.GameDetail) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { promise in
                promise(.success(true))
        }.eraseToAnyPublisher()
    }
    
    func deleteFavoriteGame(id: Int) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { promise in
                promise(.success(true))
            
        }.eraseToAnyPublisher()
    }
    
    func getFavoriteGames() -> AnyPublisher<[Domain.Game], Error> {
        return Future<[Domain.Game], Error> { promise in
            do {
                let domainGames = try self.games.map { try GameTranslator.fromDtoToDomain(game: $0) }
                promise(.success(domainGames))
            } catch {
                promise(.failure(error))
            }
        }.eraseToAnyPublisher()
    }
    
    func getFavoriteGame(id: Int) -> AnyPublisher<Domain.Game?, Error> {
        return Future<Domain.Game?, Error> { promise in
            do {
                let domainGames = try self.games.map { try GameTranslator.fromDtoToDomain(game: $0) }.first
                promise(.success(domainGames))
            } catch {
                promise(.failure(error))
            }
        }.eraseToAnyPublisher()
    }
    
    
}
