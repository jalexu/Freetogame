//
//  ArgumentValidator.swift
//  Domain
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

public class ArgumentValidator {
    static func validateEmptyParam(value: String, param: String) throws {
        if value.isEmpty {
            throw EmptyParamException.emptyField(param: param)
        }
    }
}
