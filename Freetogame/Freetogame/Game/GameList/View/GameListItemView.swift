//
//  GameListItemView.swift
//  Presentation
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 22/06/23.
//

import SwiftUI
import Domain

/**
 GameListItemView: Use this for create item for GameList
 */
struct GameListItemView: View {
    private let game: Game
    
    init(game: Game) {
        self.game = game
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    URLImageView(imageUrl: game.thumbnail)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 12)
                        )
                        .frame(width: 100, height: 100)
                    VStack(spacing: 5) {
                        if game.isFavorite {
                            Image(systemName:"star.fill")
                                .font(.system(size: 12))
                                .foregroundColor(.yellow)
                        }
                        Text(game.title)
                            .multilineTextAlignment(.leading)
                            .font(.title3)
                            .fontWeight(.heavy)
                            .padding(.leading, 1)
                            .foregroundColor(.accentColor)
                    }
                    
                }
                
                Text(game.shortDescription)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 1)
                HStack {
                    Text("Genre:")
                        .font(.footnote)
                        .fontWeight(.bold)
                    Text(game.genre)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                }
                HStack {
                    Text("Platform:")
                        .font(.footnote)
                        .fontWeight(.bold)
                    Text(game.platform)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                }
                HStack {
                    Text("Publisher:")
                        .font(.footnote)
                        .fontWeight(.bold)
                    Text(game.publisher)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                }
                HStack {
                    Text("Release date:")
                        .font(.footnote)
                        .fontWeight(.bold)
                    Text(game.releaseDate)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                }
                
            }
            
        }
    }
}

#if DEBUG
struct GameListItemView_Previews: PreviewProvider {
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
        GameListItemView(game: game!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
#endif
