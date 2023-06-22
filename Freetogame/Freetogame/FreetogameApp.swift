//
//  FreetogameApp.swift
//  Freetogame
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import SwiftUI

@main
struct FreetogameApp: App {
    var body: some Scene {
        WindowGroup {
            GameListView(viewModel: DependencyInjectionContainer.shared.resolve(GameListViewModel.self)!)
        }
    }
}
