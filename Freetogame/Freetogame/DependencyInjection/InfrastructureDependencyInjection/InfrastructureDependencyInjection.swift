//
//  InfrastructureDependencyInjection.swift
//  Presentation
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import Swinject
import Infrastructure

final class InfrastructureDependencyInjection: Assembly {
    
    func assemble(container: Container) {
        let assemblies: [Assembly] = [
            HttpClientAssembler(),
            NetworkVerifyAssembler(),
            GameAssembler()
        ]
        
        assemblies.forEach { $0.assemble(container: container) }
    }
}
