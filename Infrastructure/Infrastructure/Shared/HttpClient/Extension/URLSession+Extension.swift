//
//  URLSession+Extension.swift
//  Infrastructure
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import Foundation

public extension URLSession {
    
    static func configuration(
        timeOut: Int = 60,
        requestCahePolicy: URLRequest.CachePolicy = .reloadRevalidatingCacheData
    ) -> URLSessionConfiguration {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = requestCahePolicy
        configuration.timeoutIntervalForRequest = TimeInterval(timeOut)
        return configuration
    }
    
}
