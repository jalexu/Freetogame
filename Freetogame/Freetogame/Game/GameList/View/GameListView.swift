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
    
    func listView(games: [Game]) -> some View {
        VStack {
            List(games) { game in
                Text(game.shortDescription)
            }
        }
    }
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .loading:
                ProgressView()
                    .tint(.blue)
            case .success(let games):
                TabView {
                    listView(games: games ?? [])
                        .tabItem {
                            Label("Games", systemImage: "list.dash")
                        }
                    Text("Hola")
                        .tabItem {
                            Label("Favoritos", systemImage: "square.and.pencil")
                        }
                }
                
            case .failure(error: let error):
                Text(error.description)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .padding()
        .onAppear {
            viewModel.getGames()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView(viewModel: DependencyInjectionContainer.shared.resolve(GameListViewModel.self)!)
    }
}
