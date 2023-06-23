//
//  GameListView.swift
//  Freetogame
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import SwiftUI
import Domain
import Infrastructure

struct GameListView<ViewModel>: View where ViewModel: MovieDetailViewModelObservable {
    
    @State private var searchText = ""
    @State private var isSearching = false
    @State private var selectedTab: Int = 0
    @ObservedObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    func listContentView(games: [Game]) -> some View {
        NavigationStack {
            if !games.isEmpty {
                VStack {
                    SearchBar(searchText: $searchText,isSearching: $isSearching)
                        .padding(.top)
                    
                    List(filteredItems(games: games)) { game in
                        NavigationLink {
                            GameDatailView(viewModel:
                                            DependencyInjectionContainer.shared.resolve(
                                                GameDetailViewModel.self,
                                                arguments: game.id, arg2: game.isFavorite)!) {
                                                    viewModel.getFavoriteGames()
                                                }
                        } label: {
                            GameListItemView(game: game)
                        }
                    }
                }
            } else {
                Text("La lista de favoritos esta vacia")
            }
        }
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            switch viewModel.state {
            case .loading:
                ProgressView()
                    .tint(.primary)
            case .success(let games):
                listContentView(games: games ?? [])
                    .tabItem {
                        Label("Games", systemImage: "list.dash")
                    }
                    .tag(1)
                listContentView(games: games ?? [])
                    .tabItem {
                        Label("Favoritos", systemImage: "star")
                    }
                    .tag(2)
            case .failure(error: let error):
                Text(error.description)
                    .onAppear {
                        selectedTab = 2
                    }
            }
        }
        .onAppear {
            viewModel.getGames()
        }
        .onChange(of: selectedTab, perform: { newValue in
            if selectedTab == 2 {
                viewModel.getFavoriteGames()
            } else {
                viewModel.getGames()
            }
        })
        .navigationBarTitle("Games")
    }
    
    private func filteredItems(games: [Game]) -> [Game] {
        if searchText.isEmpty {
            return games
        } else {
            return games.filter { $0.genre.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView(viewModel: DependencyInjectionContainer.shared.resolve(GameListViewModel.self)!)
    }
}
#endif
