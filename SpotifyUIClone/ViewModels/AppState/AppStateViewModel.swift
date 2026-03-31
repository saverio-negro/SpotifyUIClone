//
//  AppStateViewModel.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/31/26.
//

import SwiftUI

@Observable
class AppStateViewModel {
    
    private(set) var isLoggedIn: Bool {
        didSet {
            UserDefaults.isLoggedIn = isLoggedIn
        }
    }
    
    init(isLoggedIn: Bool = UserDefaults.isLoggedIn) {
        self.isLoggedIn = isLoggedIn
    }
    
    func logIn() {
        self.isLoggedIn = true
    }
    
    func logOut() {
        self.isLoggedIn = false
    }
}
