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
    
    let baseURL: String = "https://www.freetogame.com/api/games"

    var enpoint: String { baseURL }
    var httpHeaders: [String: String] = [:]
    var params: [String: Any]?
    var httpMethod: Alamofire.HTTPMethod = .get
    
    init(object: Any?) {
        
    }
    
}
