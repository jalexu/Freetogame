//
//  GameDetailObservable.swift
//  Presentation
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 22/06/23.
//

import Domain

protocol GameDetailObservable: ObservableObject {
    var state: ViewModelState<GameDetail> { get }
    func getGameDetail()
}
