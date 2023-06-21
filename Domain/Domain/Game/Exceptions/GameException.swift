//
//  GameException.swift
//  Domain
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import Foundation

public enum GameException: Error, LocalizedError, Equatable {
    case unexpectedError
    case negativeNumber
    case emptyGameList
    case gameNotFound
    
    private static let gameLocalizable = "GameLocalizable"
    
    public var errorDescription: String? {
        switch self {
        case .unexpectedError:
            return "unexpectedError".localized(tableName: GameException.gameLocalizable)
        case .negativeNumber:
            return "negativeNumber".localized(tableName: GameException.gameLocalizable)
        case .emptyGameList:
            return "emptyGameList".localized(tableName: GameException.gameLocalizable)
        case .gameNotFound:
            return "emptyGame".localized(tableName: GameException.gameLocalizable)
        }
    }
    
}
