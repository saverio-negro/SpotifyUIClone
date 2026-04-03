//
//  AppView.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/31/26.
//

import SwiftUI

struct AppView: View {
    
    @State var appState = AppStateViewModel()
    let container = DependencyContainer()
    
    var body: some View {
        AppViewBuilder(
            hasCompletedOnboarding: appState.isLoggedIn,
            tabBarView: {
                TabBarView(container: container)
            },
            onboardingView: {
                WelcomeView()
            }
        )
        .environment(appState)
    }
}

#Preview("AppView — TabBar") {
    AppView(appState: AppStateViewModel(isLoggedIn: true))
}

#Preview("AppView — Onboarding") {
    AppView(appState: AppStateViewModel(isLoggedIn: false))
}
