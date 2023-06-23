//
//  GameDao.swift
//  Infrastructure
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 22/06/23.
//

import Foundation
@_implementationOnly import RealmSwift

class GameDao: Object {
    @Persisted var id: String
    @Persisted var title: String
    @Persisted var thumbnail: String
    @Persisted var shortDescription: String
    @Persisted var gameURL: String
    @Persisted var genre: String
    @Persisted var platform: String
    @Persisted var publisher: String
    @Persisted var developer: String
    @Persisted var releaseDate: String
    @Persisted var freetogameProfileURL: String
    @Persisted var isFavorite: Bool
    
    convenience init(id: String,
                     title: String,
                     thumbnail: String,
                     shortDescription: String,
                     gameURL: String,
                     genre: String,
                     platform: String,
                     publisher: String,
                     developer: String,
                     releaseDate: String,
                     freetogameProfileURL: String,
                     isFavorite: Bool) {
        self.init()
        self.id = id
        self.title = title
        self.thumbnail = thumbnail
        self.shortDescription = shortDescription
        self.gameURL = gameURL
        self.genre = genre
        self.platform = platform
        self.publisher = publisher
        self.developer = developer
        self.releaseDate = releaseDate
        self.freetogameProfileURL = freetogameProfileURL
        self.isFavorite = isFavorite
    }
}
