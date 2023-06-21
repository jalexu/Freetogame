//
//  GameListDependencyAssembler.swift
//  Presentation
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import Foundation
import Swinject
import Domain

final class GameListDependencyAssembler: Assembly {
    func assemble(container: Container) {
        container.register(GameService.self) { resolver in
            GameService(gameRepository: resolver.resolve(GameRepository.self)!)
        }
        .inObjectScope(.container)
        
        container.register(GameListViewModel.self) { resolver in
            GameListViewModel(gameService: resolver.resolve(GameService.self)!)
        }
    }
    
}
