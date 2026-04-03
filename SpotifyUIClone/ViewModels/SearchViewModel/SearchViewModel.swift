//
//  SearchViewModel.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 4/3/26.
//

import SwiftUI

protocol SearchViewModelDelegate {
    func loadUsers() async -> [User]
}

@MainActor
@Observable
class SearchViewModel {
    
    var users: [User] = []
    let delegate: SearchViewModelDelegate
    
    init(delegate: SearchViewModelDelegate) {
        self.delegate = delegate
    }
    
    func loadUsers() async {
        self.users = await self.delegate.loadUsers()
    }
}
