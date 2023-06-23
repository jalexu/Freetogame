//
//  GameService.swift
//  Domain
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import Foundation
import Combine

public class GameService {
    private let gameRepository: GameRepository
    
    public init(gameRepository: GameRepository) {
        self.gameRepository = gameRepository
    }
    
    public func getGames() -> AnyPublisher<[Game], Error> {
        return gameRepository.getGames().flatMap { games -> AnyPublisher<[Game], Error> in
            guard !games.isEmpty else {
                return Fail(error: GameException.emptyGameList).eraseToAnyPublisher()
            }
            
            return Just(games)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
        .eraseToAnyPublisher()
    }
    
    public func getGameDatail(id: Int) -> AnyPublisher<GameDetail, Error> {
        return gameRepository.getGameDetail(id: id)
    }
    
}
