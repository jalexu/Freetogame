//
//  LocalizedHelper.swift
//  Infrastructure
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import Foundation
import Foundation

public extension String {
    
    func localized(tableName: String) -> String {
        return Bundle.InfrastructureFramework.localizedString(forKey: self,
                                           value: "**\(self)**",
                                           table: tableName)
    }
    
    func localizedFormat(arguments: CVarArg..., tableName: String) -> String {
        return String(format: localized(tableName: tableName), arguments: arguments)
    }
}
