//
//  UserNetworkService.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/30/26.
//

import SwiftUI

struct UserNetworkService: NetworkService {
    typealias Data = User
    
    func getData() async throws -> [User] {
        
        guard
            let url = URL(string: "https://dummyjson.com/users")
        else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let users = try JSONDecoder().decode(Users.self, from: data)
        
        return users.users
    }
}

