//
//  AppView.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/31/26.
//

import SwiftUI

struct AppView: View {
    
    @State private var appState: AppStateViewModel
    let container = DependencyContainer()
    
    init(appState: AppStateViewModel) {
        
        self._appState = State(wrappedValue: appState)
        
        let userManager = UserManager(service: UserNetworkService())
        let productManager = ProductManager(service: ProductNetworkService())
        
        do {
            try container.register(
                UserManager.self, ProductManager.self,
                dependencies: userManager, productManager
            )
        } catch {
            print(error)
        }
    }
    
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
