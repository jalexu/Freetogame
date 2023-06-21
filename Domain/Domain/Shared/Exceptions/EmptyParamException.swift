//
//  EmptyParamException.swift
//  Domain
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import Foundation

public enum EmptyParamException: Error, LocalizedError, Equatable {
    case emptyField(param: String)

    public var errorDescription: String? {
        switch self {
        case .emptyField(let param):
            return "emptyParam".localizedFormat(arguments: param, tableName: "SharedLocalizable")
        }
    }
    
}
