//
//  ContentView.swift
//  Freetogame
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import SwiftUI

struct ContentView<ViewModel>: View where ViewModel: MovieDetailViewModelObservable {
    
    @ObservedObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .onAppear {
                    viewModel.getGames()
                }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: DependencyInjectionContainer.shared.resolve(GameListViewModel.self)!)
    }
}
