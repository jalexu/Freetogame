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
    private let gameLocalRepository: GameLocalRepository
    
    init(gameRemoteRepository: GameRemoteRepository,
         networkVerify: NetworkVerify,
         gameLocalRepository: GameLocalRepository) {
        self.gameRemoteRepository = gameRemoteRepository
        self.networkVerify = networkVerify
        self.gameLocalRepository = gameLocalRepository
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
    
    func saveFavoriteGame(game: Domain.GameDetail) -> AnyPublisher<Bool, Error> {
        return gameLocalRepository.saveFavoriteGame(game: game)
    }
    
    func deleteFavoriteGame(id: Int) -> AnyPublisher<Bool, Error> {
        return gameLocalRepository.deleteFavoriteGame(id: id)
    }
    
    func getFavoriteGames() -> AnyPublisher<[Domain.Game], Error> {
        return gameLocalRepository.getFavoriteGames()
    }
    
}
