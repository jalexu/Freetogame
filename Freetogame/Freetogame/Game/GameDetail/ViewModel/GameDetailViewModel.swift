//
//  GameDetailViewModel.swift
//  Presentation
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 22/06/23.
//

import Foundation
import Combine
import Domain
import Infrastructure

final class GameDetailViewModel {
    private let gameService: GameService
    private let gameLocalRepository: GameLocalRepository
    private let idGame: Int
    private let isFavorite: Bool
    private var cancellables = Set<AnyCancellable>()
    @Published var state = ViewModelState<Domain.GameDetail>.loading
    var gameDetail: Domain.GameDetail?
    
    init(gameService: GameService,
         gameLocalRepository: GameLocalRepository,
         idGame: Int,
         isFavorite: Bool) {
        self.gameService = gameService
        self.gameLocalRepository = gameLocalRepository
        self.idGame = idGame
        self.isFavorite = isFavorite
    }
}

extension GameDetailViewModel: GameDetailObservable {
    
    func getGameDetail() {
        state = .loading
        gameService.getGameDatail(id: idGame)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard case .failure(let error) = completion else { return }
                self?.state = .failure(error: error.localizedDescription)
            }, receiveValue: { [weak self] detail in
                self?.gameDetail = detail
                self?.gameDetail?.isfavorite = self?.isFavorite ?? false
                self?.state = .success(data: self?.gameDetail)
            })
            .store(in: &cancellables)
    }
    
    func saveFavoriteGame() {
        guard let game = gameDetail, game.isfavorite == false else {
            return
        }
        gameLocalRepository.saveFavoriteGame(game: game)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard case .failure(let error) = completion else { return }
                self?.state = .failure(error: error.localizedDescription)
            }, receiveValue: {  status in
                print(status)
            })
            .store(in: &cancellables)
    }
    
    func deleteFavoriteGame() {
        guard let game = gameDetail, game.isfavorite == true else {
            return
        }
        gameLocalRepository.deleteFavoriteGame(id: game.id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard case .failure(let error) = completion else { return }
                self?.state = .failure(error: error.localizedDescription)
            }, receiveValue: { status in
                print(status)
            })
            .store(in: &cancellables)
    }
}
