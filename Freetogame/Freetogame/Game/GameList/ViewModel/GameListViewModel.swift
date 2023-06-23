//
//  GameListViewModel.swift
//  Presentation
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import Foundation
import Combine
import Domain

final class GameListViewModel {
    private let gameService: GameService
    private var cancellables = Set<AnyCancellable>()
    var favoritesGames: [Domain.Game] = []
    @Published var state = ViewModelState<[Game]>.loading
 
    
    init(gameService: GameService) {
        self.gameService = gameService
    }
}

extension GameListViewModel: MovieDetailViewModelObservable {
    func getGames() {
        state = .loading
        gameService.getGames()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                guard case .failure(let error) = completion else { return }
                self.state = .failure(error: error.localizedDescription)
            }, receiveValue: { responseGames in
                self.state = .success(data: responseGames)
            })
            .store(in: &cancellables)
    }
    
    func getFavoriteGames() {
        state = .loading
        gameService.getFavoriteGames()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                guard case .failure(let error) = completion else { return }
                self.state = .failure(error: error.localizedDescription)
            }, receiveValue: { responseGames in
                self.state = .success(data: responseGames)
            })
            .store(in: &cancellables)
    }
}
