//
//  GameRepository.swift
//  Domain
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import Foundation
import Combine

public protocol GameRepository {
    func getGames() -> AnyPublisher<[Game], Error>
    func getGameDetail(id: Int) -> AnyPublisher<Domain.GameDetail, Error>
}
