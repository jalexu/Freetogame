//
//  ViewModelState.swift
//  Presentation
//
//  Created by Jaime Alexander Uribe Uribe - Ceiba Software on 21/06/23.
//

import Foundation

enum ViewModelState<T>: Equatable where T: Equatable {
    case loading
    case success(data: T?)
    case failure(error: String)
}
