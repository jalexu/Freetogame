//
//  NetworkVerifyAssembler.swift
//  Infrastructure
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import Swinject

public final class NetworkVerifyAssembler: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        container.register(NetworkVerify.self) { _ in
            NetworkVerify()
        }
        .inObjectScope(.container)
    }
}
