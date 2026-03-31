//
//  ProductViewModel.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/30/26.
//

import SwiftUI

protocol ProductViewModelDelegate {
    func loadProducts() async -> [Product]
}

@MainActor
@Observable
class ProductViewModel {
    var products: [Product] = []
    let delegate: ProductViewModelDelegate
    
    init(delegate: ProductViewModelDelegate) {
        self.delegate = delegate
    }
    
    func loadProducts() async {
        self.products = await self.delegate.loadProducts()
    }
}

