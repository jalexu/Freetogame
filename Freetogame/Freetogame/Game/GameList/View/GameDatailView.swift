//
//  GameDatailView.swift
//  Presentation
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 22/06/23.
//

import SwiftUI
import Domain

struct GameDatailView: View {
    let game: Game
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                // Image game
                URLImageView(imageUrl: game.thumbnail)
                
                // Description
                Text(game.shortDescription)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                
                
                Text(game.genre)
                Text(game.platform)
                Text(game.publisher)
                Text(game.releaseDate)
                
                Text(game.gameURL)

            }
        }
        .navigationBarTitle(game.title, displayMode: .inline)
    }
}

#if DEBUG
struct GameDatailView_Previews: PreviewProvider {
    static let game = try? Domain.Game(
        id: 457,
        title: "The Third Age",
        thumbnail: "https://www.freetogame.com/g/457/thumbnail.jpg",
        shortDescription: "A free-to-play browser-based Strategy MMO game focused on story-based PvE gameplay!",
        gameURL: "https://www.freetogame.com/open/the-third-age",
        genre: "Strategy",
        platform: "Web Browser",
        publisher: "R2 Games",
        developer: "R2 Games",
        releaseDate: "2019-04-29",
        freetogameProfileURL: "https://www.freetogame.com/the-third-age")
    static var previews: some View {
        NavigationView {
            GameDatailView(game: game!)
        }
       
    }
}
#endif
