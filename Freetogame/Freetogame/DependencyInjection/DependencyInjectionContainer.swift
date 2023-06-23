//
//  DependencyInjectionContainer.swift
//  Presentation
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import Foundation
import Swinject
import Infrastructure

final class DependencyInjectionContainer {
    static let shared = DependencyInjectionContainer()

    let assembler: Assembler
    
    init() {
        assembler = Assembler(
            [
                InfrastructureDependencyInjection(),
                GameDependencyInjection()
            ]
        )
    }
        
    func resolve<Service>(_ serviceType: Service.Type) -> Service? {
        return assembler.resolver.resolve(serviceType)
    }
    
    func resolve<Service>(_ serviceType: Service.Type, arguments arg1: Int, arg2: Bool) -> Service? {
        return assembler.resolver.resolve(serviceType, arguments: arg1, arg2)
    }
}

