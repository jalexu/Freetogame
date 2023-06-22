//
//  URLImageView.swift
//  Presentation
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 22/06/23.
//

import SwiftUI

/**
 URLImageView: Use this view when you want call image from API
*/
struct URLImageView: View {
    private var imageUrl: String
    
    init(imageUrl: String) {
        self.imageUrl = imageUrl
    }
    
    var body: some View {
        AsyncImage(url: URL(string: "\(imageUrl)")) { phase  in
            switch phase {
            case .success(let image):
                image
                    .imageModifier()
            case .failure(_):
                Image(systemName: "person.crop.circle.badge.exclamationmark.fill")
                    .iconModifier()
            case .empty:
                ProgressView()
                    .background(.clear)
                    .tint(.white)
            @unknown default:
                ProgressView()
                    .background(.clear)
                    .tint(.white)
            }
        }
    }
}

#if DEBUG
struct URLImageView_Previews: PreviewProvider {
    static var previews: some View {
        URLImageView(imageUrl: "www")
    }
}
#endif

