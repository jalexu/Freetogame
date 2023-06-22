//
//  GameDetailRequest.swift
//  Infrastructure
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 22/06/23.
//

import Foundation
import Alamofire

struct GameDetailRequest: HttpClientRequest {
    typealias Model = Int
    
    let baseURL: String = Bundle.main.object(forInfoDictionaryKey: "BaseURL") as? String ?? ""

    var enpoint: String { "\(baseURL)/game" }
    var httpHeaders: [String: String] = [:]
    var params: [String: Any]?
    var httpMethod: Alamofire.HTTPMethod = .get
    
    init(object: Int) {
        params = ["id": object]
    }
    
}
