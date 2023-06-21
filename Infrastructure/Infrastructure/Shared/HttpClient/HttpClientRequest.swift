//
//  HttpClientRequest.swift
//  Infrastructure
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import Alamofire

public protocol HttpClientRequest {
    associatedtype Object
    
    var enpoint: String { get }
    var httpHeaders: [String: String] { get }
    var params: [String: Any]? { get }
    var paramsJSON: String { get }
    var httpMethod: HTTPMethod { get }
    
    init(object: Object)
}

extension HttpClientRequest {
    var paramsJSON: String { "" }
}
