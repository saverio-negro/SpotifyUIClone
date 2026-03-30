//
//  UserManager.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/30/26.
//

import SwiftUI

actor UserManager: DataSource {
    typealias Data = User
    
    let service: UserNetworkService
    
    init(service: UserNetworkService) {
        self.service = service
    }
    
    func getData() async -> [User] {
        return (try? await self.service.getData()) ?? []
    }
}

