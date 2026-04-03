//
//  HomeViewModel.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/30/26.
//

import SwiftUI

protocol HomeViewModelDelegate {
    func loadUsers() async -> [User]
}

@MainActor
@Observable
class HomeViewModel {
    var users: [User] = []
    let delegate: HomeViewModelDelegate
    
    init(delegate: HomeViewModelDelegate) {
        self.delegate = delegate
    }
    
    func loadUsers() async {
        self.users = await self.delegate.loadUsers()
    }
}
