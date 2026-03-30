//
//  Product.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/30/26.
//

import SwiftUI

struct Products: Codable {
    let products: [Product]
}

struct Product: Identifiable, Hashable, Codable {
    let id: Int
    let title, description: String
    let price: Double
}

