//
//  UserDefaults+Keys.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/31/26.
//

import SwiftUI

extension UserDefaults {
    
    struct Keys {
        static let isLoggedIn = "isLoggedIn"
    }
    
    static func getKey<T>(forKeyPath keyPath: KeyPath<Keys.Type, T>) -> T {
        Self.Keys[keyPath: keyPath]
    }
}

