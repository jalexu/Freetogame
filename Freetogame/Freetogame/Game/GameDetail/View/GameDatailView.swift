//
//  GameDatailView.swift
//  Presentation
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 22/06/23.
//

import SwiftUI
import Domain

struct GameDatailView<ViewModel>: View where ViewModel: GameDetailObservable {
    
    @ObservedObject private var viewModel: ViewModel
    @State private var isFavorited: Bool = false
    private var reloadGames: () -> Void
    
    init(viewModel: ViewModel,
         reloadGames: @escaping () -> Void) {
        self.viewModel = viewModel
        self.reloadGames = reloadGames
    }
    
    @ViewBuilder
    private func descriptionView(title: String, description: String) -> some View {
        HStack {
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.accentColor)
            Text(description)
                .font(.body)
                .multilineTextAlignment(.leading)
        }
    }
    
    @ViewBuilder
    private func galleryImagesView(screenshots: [Screenshot]) -> some View {
        Group {
            HStack(alignment: .center) {
                Image(systemName: "photo.on.rectangle.angled")
                    .foregroundColor(.accentColor)
                    .imageScale(.large)
                Text("Pictures")
                    .font(.title3)
                    .fontWeight(.bold)
            }
            
            GalleryView(screenshots: screenshots)
        }
    }
    
    @ViewBuilder
    private func sistemRequirementsView(requirements: MinimumSystemRequirements?) -> some View {
            VStack(alignment: .center) {
                HStack() {
                    Image(systemName: "hand.raised.square.on.square")
                        .foregroundColor(.accentColor)
                        .imageScale(.large)
                    Text("Requirements")
                        .font(.title3)
                        .fontWeight(.bold)
                }
                .padding(.vertical)
                VStack(alignment: .leading, spacing: 20) {
                    descriptionView(title: "OS:", description: requirements?.os ?? "")
                    descriptionView(title: "Processor:", description: requirements?.processor ?? "")
                    descriptionView(title: "Memory:", description: requirements?.memory ?? "")
                    descriptionView(title: "raphics:", description: requirements?.graphics ?? "")
                }
                
            }
    }
    
    func favoriteView(isFavorite: Bool) -> some View {
        HStack {
            Text("Mark like favorite")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.accentColor)
                .padding(.leading)
            
            Spacer()
            
            Button {
                isFavorited.toggle()
                if isFavorited {
                    viewModel.saveFavoriteGame()
                } else {
                    viewModel.deleteFavoriteGame()
                    reloadGames()
                }
            } label: {
                Image(systemName: isFavorited ? "star.fill" : "star")
                    .font(.system(size: 20))
                    .foregroundColor(.yellow)
                    .padding(.trailing)
            }
            .onAppear{
                isFavorited = isFavorite
            }
        }
        .padding([.top, .bottom], 15)
    }
    
    var body: some View {
            ScrollView(.vertical, showsIndicators: false) {
                switch viewModel.state {
                case .loading:
                    ProgressView()
                        .tint(.primary)
                case .success(let detail):
                    LazyVStack(alignment: .center, spacing: 20) {
                        favoriteView(isFavorite: detail?.isfavorite ?? false)
                        // Image game
                        URLImageView(imageUrl: detail?.thumbnail ?? "")
                        
                        // Description
                        Text(detail?.description ?? "")
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        
                        galleryImagesView(screenshots: detail?.screenshots ?? [])
                        
                        VStack(alignment: .leading, spacing: 20) {
                            descriptionView(title: "Genre:", description: detail?.genre ?? "")
                            
                            descriptionView(title: "Platform:", description: detail?.platform ?? "")
                            
                            descriptionView(title: "Publisher:", description: detail?.publisher ?? "")
                            
                            descriptionView(title: "Release date:", description: detail?.releaseDate ?? "")
                            
                            descriptionView(title: "GameURL:", description: detail?.gameURL ?? "")
                        }
                        .padding(.horizontal, 1)
                        
                        sistemRequirementsView(requirements: detail?.minimumSystemRequirements)
                        
                    }
                    .padding(.horizontal)
                    .navigationBarTitle(detail?.title ?? "", displayMode: .inline)
                case .failure(let error):
                    Text(error.description)
                }
            }
            .onAppear {
                viewModel.getGameDetail()
            }
    }
}

#if DEBUG
struct GameDatailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GameDatailView(viewModel: DependencyInjectionContainer.shared.resolve(
                GameDetailViewModel.self,
                arguments: 452, arg2: false)!,reloadGames: {})
        }
    }
}
#endif
