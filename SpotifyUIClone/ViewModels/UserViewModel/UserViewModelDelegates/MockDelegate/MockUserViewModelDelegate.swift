//
//  MockUserViewModelDelegate.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/30/26.
//

import SwiftUI

struct MockUserViewModelDelegate<DS: DataSource>: UserViewModelDelegate {
    
    let userDataSource: DS
    
    init(userDataSource: DS) {
        self.userDataSource = userDataSource
    }
    
    func loadUsers() async -> [User] {
        return await (self.userDataSource.getData() as? [User]) ?? []
    }
}
