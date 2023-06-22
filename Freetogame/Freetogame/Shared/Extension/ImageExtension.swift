//
//  ImageExtension.swift
//  Presentation
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 22/06/23.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
            
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()
            .frame(maxWidth: 150)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}

