//
//  GameListView.swift
//  Freetogame
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import SwiftUI
import Domain

struct GameListView<ViewModel>: View where ViewModel: MovieDetailViewModelObservable {
    
    @ObservedObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    func listContentView(games: [Game]) -> some View {
        NavigationStack {
            List(games) { game in
                NavigationLink {
                    GameDatailView(
                        viewModel:DependencyInjectionContainer.shared.resolve(
                            GameDetailViewModel.self,
                            argument: game.id)!
                    )
                } label: {
                    GameListItemView(game: game)
                }
                
            }
        }
    }
    
    var body: some View {
        TabView {
            switch viewModel.state {
            case .loading:
                ProgressView()
                    .tint(.primary)
            case .success(let games):
                listContentView(games: games ?? [])
                    .tabItem {
                        Label("Games", systemImage: "list.dash")
                    }
                Text("Hola")
                    .tabItem {
                        Label("Favoritos", systemImage: "star")
                    }
            case .failure(error: let error):
                Text(error.description)
            }
        }
        .onAppear {
            viewModel.getGames()
        }
        .navigationBarTitle("Games")
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView(viewModel: DependencyInjectionContainer.shared.resolve(GameListViewModel.self)!)
    }
}
#endif
