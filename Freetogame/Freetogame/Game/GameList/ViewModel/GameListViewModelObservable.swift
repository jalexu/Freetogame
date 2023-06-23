//
//  GameListViewModelObservable.swift
//  Presentation
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import Domain
import SwiftUI

protocol MovieDetailViewModelObservable: ObservableObject {
    var state: ViewModelState<[Game]> { get }
    var favoritesGames: [Game] { get set }
    func getGames()
    func getFavoriteGames()
}
