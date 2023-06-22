//
//  GameDependencyInjection.swift
//  Presentation
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import Swinject

final class GameDependencyInjection: Assembly {
    func assemble(container: Container) {
        let assemblies: [Assembly] = [
            GameListDependencyAssembler(),
            GameDetailDependencyAssembler()
        ]
        
        assemblies.forEach { $0.assemble(container: container) }
    }
}
