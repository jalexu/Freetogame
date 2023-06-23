//
//  GameDetailDependencyAssembler.swift
//  Presentation
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 22/06/23.
//

import Foundation
import Swinject
import Domain

final class GameDetailDependencyAssembler: Assembly {
    func assemble(container: Container) {
        container.register(GameDetailViewModel.self) { (resolver, idGame: Int, isFavorite: Bool) in
            GameDetailViewModel(gameService: resolver.resolve(GameService.self)!,
                                idGame: idGame,
                                isFavorite: isFavorite)
        }
    }
    
}
