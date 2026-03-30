//
//  MockProductViewModelDelegate.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/30/26.
//

import SwiftUI

struct MockProductViewModelDelegate<DS: DataSource>: ProductViewModelDelegate {
    
    let productDataSource: DS
    
    init(dataSource: DS) {
        self.productDataSource = dataSource
    }
    
    func loadProducts() async -> [Product] {
        await (self.productDataSource.getData() as? [Product]) ?? []
    }
}
