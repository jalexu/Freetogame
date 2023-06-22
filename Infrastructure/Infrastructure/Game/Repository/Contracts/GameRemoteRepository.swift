//
//  GameRemoteRepository.swift
//  Infrastructure
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import Foundation
import Combine
import Domain

protocol GameRemoteRepository {
    func getGames() throws -> AnyPublisher<[Domain.Game], Error>
    func getGameDatail(id: Int) throws -> AnyPublisher<Domain.GameDetail, Error>
}
