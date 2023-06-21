//
//  GameListViewModelObservable.swift
//  Presentation
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import Domain

protocol MovieDetailViewModelObservable: ObservableObject {
    var state: ViewModelState<[Game]> { get }
    func getGames()
}
