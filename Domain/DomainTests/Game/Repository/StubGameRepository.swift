//
//  StubGameRepository.swift
//  DomainTests
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import Foundation
import Combine
@testable import Domain

struct StubGameRepository: GameRepository {
    func getGameDetail(id: Int) -> AnyPublisher<Domain.GameDetail, Error> {
        <#code#>
    }
    
    var games: [Game] = []
    
    func getGames() -> AnyPublisher<[Domain.Game], Error> {
        return Future<[Domain.Game], Error> { promise in
            promise(.success(self.games))
        }.eraseToAnyPublisher()
    }
    
}
