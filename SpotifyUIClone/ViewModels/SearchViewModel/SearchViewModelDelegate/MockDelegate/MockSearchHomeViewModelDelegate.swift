//
//  MockSearchHomeViewModelDelegate.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 4/3/26.
//

import SwiftUI

struct MockSearchHomeViewModelDelegate<DS: DataSource>: SearchViewModelDelegate {
    
    let userDataSource: DS
    
    init(userDataSource: DS) {
        self.userDataSource = userDataSource
    }
    
    func loadUsers() async -> [User] {
        return await (self.userDataSource.getData() as? [User]) ?? []
    }
}

