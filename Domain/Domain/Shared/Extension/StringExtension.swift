//
//  StringExtension.swift
//  Domain
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 22/06/23.
//

import Foundation

extension String {
    func convertToDateFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let newDate = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let formattedDate = dateFormatter.string(from: newDate)
            return formattedDate
        }
        
        return self
    }
}
