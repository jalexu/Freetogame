//
//  GameDetailViewModel.swift
//  Presentation
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 22/06/23.
//

import Foundation
import Combine
import Domain

final class GameDetailViewModel {
    private let gameService: GameService
    private let idGame: Int
    private var cancellables = Set<AnyCancellable>()
    @Published var state = ViewModelState<GameDetail>.loading
    
    init(gameService: GameService, idGame: Int ) {
        self.gameService = gameService
        self.idGame = idGame
    }
}

extension GameDetailViewModel: GameDetailObservable {
    func getGameDetail() {
        state = .loading
        gameService.getGameDatail(id: idGame)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                guard case .failure(let error) = completion else { return }
                self.state = .failure(error: error.localizedDescription)
            }, receiveValue: { detail in
                self.state = .success(data: detail)
            })
            .store(in: &cancellables)
    }
}
