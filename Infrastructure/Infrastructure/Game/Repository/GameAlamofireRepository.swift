//
//  GameAlamofireRepository.swift
//  Infrastructure
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import Foundation
import Combine
import Domain

class GameAlamofireRepository: GameRemoteRepository {
    private let httpClient: HttpClient
    
    init(httpClient: HttpClient) {
        self.httpClient = httpClient
    }
    
    func getGames() throws -> AnyPublisher<[Domain.Game], Error> {
        let request = GetGamesRequest(object: nil)
        
        return httpClient.requestGeneric(request: request,
                                         entity: [Game].self,
                                         queue: .global(),
                                         retries: 1)
        .tryMap { games in
            return try games.compactMap { game in
                do {
                    return try GameTranslator.fromDtoToDomain(game: game)
                } catch {
                   throw error
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func getGameDatail(id: Int) -> AnyPublisher<Domain.GameDetail, Error> {
        let request = GameDetailRequest(object: id)
        
        return httpClient.requestGeneric(request: request,
                                         entity: GameDetail.self,
                                         queue: .global(),
                                         retries: 1)
        .tryMap { game in
            do {
                return try GameTranslator.fromGameDetailDtoToDomain(gameDetail: game)
            } catch {
                throw error
            }
        }
        .eraseToAnyPublisher()
        
    }
}
