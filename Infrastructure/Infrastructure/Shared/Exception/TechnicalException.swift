//
//  TechnicalException.swift
//  Infrastructure
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

public enum TechnicalException: Error, LocalizedError, Equatable {
    case technicalError
    case notConnectedToNetwork

    private static let infrastructureLocalizable = "InfrastructureLocalizable"
    
    public var errorDescription: String? {
        switch self {
        case .technicalError:
            return "technicalExceptionMessage".localized(tableName: TechnicalException.infrastructureLocalizable)
        case .notConnectedToNetwork:
            return "notConnectedToNetwork".localized(tableName: TechnicalException.infrastructureLocalizable)
        }
        
    }
}
