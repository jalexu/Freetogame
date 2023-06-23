//
//  SearchBar.swift
//  Presentation
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 23/06/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var isSearching: Bool
    
    var body: some View {
        HStack {
            TextField("Search for genre", text: $searchText)
                .padding(.leading, 24)
            
            Button(action: {
                searchText = ""
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .padding(.trailing)
                    .opacity(searchText.isEmpty ? 0 : 1)
            })
        }
        .padding()
        .background(Color(.systemGray5))
        .cornerRadius(10)
        .padding(.horizontal)
        .onTapGesture {
            isSearching = true
        }
    }
}
