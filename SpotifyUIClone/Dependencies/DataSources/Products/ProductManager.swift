//
//  ProductManager.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/30/26.
//

import SwiftUI

actor ProductManager: DataSource {
    typealias Data = Product
    
    let service: ProductNetworkService
    
    init(service: ProductNetworkService) {
        self.service = service
    }
    
    func getData() async -> [Product] {
        return (try? await self.service.getData()) ?? []
    }
}
