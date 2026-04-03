//
//  SpotifyUICloneApp.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/29/26.
//

import SwiftUI

@main
struct SpotifyUICloneApp: App {
    
    let appState = AppStateViewModel()
    
    var body: some Scene {
        WindowGroup {
            AppView(appState: appState)
        }
    }
}
