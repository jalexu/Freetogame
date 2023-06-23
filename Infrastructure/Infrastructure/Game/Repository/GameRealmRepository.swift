//
//  GameRealmRepository.swift
//  Infrastructure
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 23/06/23.
//

import Foundation
import Combine
import Domain
@_implementationOnly import RealmSwift

class GameRealmRepository: GameLocalRepository {
    
    private let realmManager: RealmManagerProtocol
    
    init(realmManager: RealmManagerProtocol) {
        self.realmManager = realmManager
    }
    
    func saveFavoriteGame(game: Domain.GameDetail) -> AnyPublisher<Bool, Error> {
        let gameDao: Object = GameTranslator.fromGameToGameDao(game: game)
        return realmManager.save(object: gameDao)
    }
    
    func deleteFavoriteGame(id: Int) -> AnyPublisher<Bool, Error> {
        return realmManager.delete(plaqueId: String(id), GameDao.self)
    }
    
    func getFavoriteGames() -> AnyPublisher<[Domain.Game], Error> {
        return realmManager.fetchObjects(GameDao.self).tryMap { games in
            return try games.compactMap { dao in
                do {
                    return try GameTranslator.fromGameDaoToGameDomain(game: dao)
                } catch {
                   throw error
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    
}
