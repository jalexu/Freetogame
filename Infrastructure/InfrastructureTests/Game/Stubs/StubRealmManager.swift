//
//  StubRealmManager.swift
//  InfrastructureTests
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 23/06/23.
//

import Foundation
import Combine
@testable import Infrastructure
@testable import Domain
@_implementationOnly import RealmSwift

final class StubRealmManager: RealmManagerProtocol {
    
    var gameDao: GameDao = GameDao(id: "457",
                                   title: "The Third Age",
                                   thumbnail: "https://www.freetogame.com/g/457/thumbnail.jpg",
                                   shortDescription: "A free-to-play browser-based Strategy MMO game focused on story-based PvE gameplay!",
                                   gameURL: "https://www.freetogame.com/open/the-third-age",
                                   genre: "Strategy",
                                   platform: "Web Browser",
                                   publisher: "R2 Games",
                                   developer: "R2 Games",
                                   releaseDate: "2019-04-29",
                                   freetogameProfileURL: "https://www.freetogame.com/the-third-age",
                                   isFavorite: true)
    
    var error: Error?
    
    func save<T>(object dto: T) -> AnyPublisher<Bool, Error> where T : Object {
        let subject = CurrentValueSubject<Bool, Error>(true)
        
        if let error = error {
            subject.send(completion: .failure(error))
        }
        
        return subject.eraseToAnyPublisher()
    }
    
    func fetchObjects<T: Object>(_ type: T.Type) -> AnyPublisher<[T], Never> {
        var subject = CurrentValueSubject<[T], Never>(Array(_immutableCocoaArray: gameDao))
        return subject.eraseToAnyPublisher()
    }
    
    func fetchObject<T: Object>(id: String, _ type: T.Type) -> AnyPublisher<T?, Never> {
        var subject = CurrentValueSubject<T?, Never>(gameDao as? T)
        return subject.eraseToAnyPublisher()
    }
    
    func delete<T>(id: String, _ type: T.Type) -> AnyPublisher<Bool, Error> where T : Object {
        let subject = CurrentValueSubject<Bool, Error>(true)
        
        if let error = error {
            subject.send(completion: .failure(error))
        }
        
        return subject.eraseToAnyPublisher()
    }
}
