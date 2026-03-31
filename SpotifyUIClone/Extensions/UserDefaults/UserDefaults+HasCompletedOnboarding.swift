//
//  UserDefaults+HasCompletedOnboarding.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/31/26.
//

import SwiftUI

extension UserDefaults {
    static var isLoggedIn: Bool {
        get {
            Self.standard.bool(forKey: Self.getKey(forKeyPath: \.isLoggedIn))
        }
        
        set {
            Self.standard.set(newValue, forKey: Self.getKey(forKeyPath: \.isLoggedIn))
        }
    }
}

