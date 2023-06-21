//
//  GameAssembler.swift
//  Infrastructure
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import Swinject
import Domain
import CoreData

public class GameAssembler: Assembly {
    
    public init() {}
    
    public func assemble(container: Swinject.Container) {
        container.register(GameRemoteRepository.self) { resolver in
            GameAlamofireRepository(httpClient: resolver.resolve(HttpClient.self)!)
        }
        .inObjectScope(.container)
        
        container.register(GameRepository.self) { resolver in
            GameProxy(gameRemoteRepository: resolver.resolve(GameRemoteRepository.self)!,
                      networkVerify: resolver.resolve(NetworkVerify.self)!)
        }
        .inObjectScope(.container)
    }
}
