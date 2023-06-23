//
//  GameLocalRepository.swift
//  Infrastructure
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 23/06/23.
//

import Foundation
import Combine
import Domain

public protocol GameLocalRepository {
    func saveFavoriteGame(game: Domain.GameDetail) -> AnyPublisher<Bool, Error>
    func deleteFavoriteGame(id: Int) -> AnyPublisher<Bool, Error>
    func getFavoriteGames() -> AnyPublisher<[Domain.Game], Error>
    func getFavoriteGame(id: Int) -> AnyPublisher<Domain.Game?, Error>
}
