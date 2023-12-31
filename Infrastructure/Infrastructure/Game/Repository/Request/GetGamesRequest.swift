//
//  GetGamesRequest.swift
//  Infrastructure
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import Foundation
import Alamofire

struct GetGamesRequest: HttpClientRequest {
    typealias Model = Any?
    
    let baseURL: String = Bundle.main.object(forInfoDictionaryKey: "BaseURL") as? String ?? ""

    var enpoint: String { "\(baseURL)/games" }
    var httpHeaders: [String: String] = [:]
    var params: [String: Any]?
    var httpMethod: Alamofire.HTTPMethod = .get
    
    init(object: Any?) {
        
    }
    
}
