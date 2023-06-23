//
//  GalleryView.swift
//  Presentation
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 23/06/23.
//

import SwiftUI
import Domain

/**
 GalleryView: Use this for create image carrusel
 */
struct GalleryView: View {
    let screenshots: [Screenshot]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(screenshots, id: \.self) { item in
                    URLImageView(imageUrl: item.image)
                        .frame(height: 200)
                        .cornerRadius(12)
                }
            }
        }
    }
}
#if DEBUG
struct GalleryView_Previews: PreviewProvider {
    static let screenshots = [Screenshot(
        id: 2,
        image: "https://www.freetogame.com/g/452/Call-of-Duty-Warzone-1.jpg")]
    static var previews: some View {
        GalleryView(screenshots: screenshots)
    }
}
#endif
