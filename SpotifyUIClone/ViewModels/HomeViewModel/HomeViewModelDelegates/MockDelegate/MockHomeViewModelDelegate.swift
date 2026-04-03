//
//  MockHomeViewModelDelegate.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/30/26.
//

import SwiftUI

struct MockHomeViewModelDelegate<UDS: DataSource, PDS: DataSource>: HomeViewModelDelegate {
    
    let userDataSource: UDS
    let productDataSource: PDS
    
    init(userDataSource: UDS, productDataSource: PDS) {
        self.userDataSource = userDataSource
        self.productDataSource = productDataSource
    }
    
    func loadUsers() async -> [User] {
        return await (self.userDataSource.getData() as? [User]) ?? []
    }
    
    func loadProducts() async -> [Product] {
        return await (self.productDataSource.getData() as? [Product]) ?? []
    }
}
