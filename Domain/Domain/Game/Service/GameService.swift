//
//  GameService.swift
//  Domain
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import Foundation

public class GameService {
    
    private let gameRepository: GameRepository
    
    public init(gameRepository: GameRepository) {
        self.gameRepository = gameRepository
    }
}
