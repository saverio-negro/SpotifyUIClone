//
//  ProductNetworkService.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/30/26.
//

import SwiftUI

struct ProductNetworkService: NetworkService {
    typealias Data = Product
    
    func getData() async throws -> [Product] {
        
        guard
            let url = URL(string: "https://dummyjson.com/products")
        else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let products = try JSONDecoder().decode(Products.self, from: data)
        
        return products.products
    }
}

