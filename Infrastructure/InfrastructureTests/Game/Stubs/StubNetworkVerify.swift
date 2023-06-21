//
//  StubNetworkVerify.swift
//  InfrastructureTests
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import Foundation
import Combine
@testable import Infrastructure

final class StubNetworkVerify: NetworkVerify {
    var isConnected = true

    override func hasInternetConnection() -> AnyPublisher<Bool, Error> {
        return Just(isConnected)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
    }
}
