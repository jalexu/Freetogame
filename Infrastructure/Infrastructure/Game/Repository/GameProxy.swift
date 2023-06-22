//
//  GameProxy.swift
//  Infrastructure
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import Foundation
import Combine
import Domain
@_implementationOnly import RealmSwift

class GameProxy: GameRepository {
    private let gameRemoteRepository: GameRemoteRepository
    private let networkVerify: NetworkVerify
    private let realmManager: RealmManagerProtocol
    
    init(gameRemoteRepository: GameRemoteRepository,
         networkVerify: NetworkVerify,
         realmManager: RealmManagerProtocol) {
        self.gameRemoteRepository = gameRemoteRepository
        self.networkVerify = networkVerify
        self.realmManager = realmManager
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
    
    func getGameDetail(id: Int) -> AnyPublisher<Domain.GameDetail, Error> {
        return networkVerify.hasInternetConnection().flatMap { isConnected -> AnyPublisher<Domain.GameDetail, Error> in
            guard isConnected else {
                return Fail(error: TechnicalException.notConnectedToNetwork).eraseToAnyPublisher()
            }
            do {
                return try self.gameRemoteRepository.getGameDatail(id: id)
            } catch {
                return Fail(error: error).eraseToAnyPublisher()
            }
        }
        .eraseToAnyPublisher()
    }
    
    func saveFavoriteGame(game: Domain.Game) -> AnyPublisher<Bool, Error> {
        let gameDao: Object = GameTranslator.fromGameToGameDao(game: game)
        return realmManager.save(object: gameDao)
    }
    
}
