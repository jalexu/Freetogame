//
//  GameProxy.swift
//  Infrastructure
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import Foundation
import Combine
import Domain

class GameProxy: GameRepository {
    private let gameRemoteRepository: GameRemoteRepository
    private let networkVerify: NetworkVerify
    
    init(gameRemoteRepository: GameRemoteRepository,
         networkVerify: NetworkVerify) {
        self.gameRemoteRepository = gameRemoteRepository
        self.networkVerify = networkVerify
    }
    
    func getGames() -> AnyPublisher<[Domain.Game], Error> {
        return networkVerify.hasInternetConnection().flatMap { isConnected -> AnyPublisher<[Domain.Game], Error>  in
            guard isConnected else {
                return Fail(error: TechnicalException.notConnectedToNetwork).eraseToAnyPublisher()
            }
            do {
                return try self.gameRemoteRepository.getGames()
            } catch {
                return Fail(error: error).eraseToAnyPublisher()
            }
        }
        .eraseToAnyPublisher()
    }
    
}
