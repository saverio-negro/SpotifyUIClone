//
//  UserViewModel.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/30/26.
//

import SwiftUI

protocol UserViewModelDelegate {
    func loadUsers() async -> [User]
}

@MainActor
@Observable
class UserViewModel {
    var users: [User] = []
    let delegate: UserViewModelDelegate
    
    init(delegate: UserViewModelDelegate) {
        self.delegate = delegate
    }
    
    func loadUsers() async {
        self.users = await self.delegate.loadUsers()
    }
}
