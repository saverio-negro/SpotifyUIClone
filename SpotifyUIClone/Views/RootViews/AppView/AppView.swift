//
//  AppView.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/31/26.
//

import SwiftUI

struct AppViewBuilder<TabBarView: View, OnboardingView: View>: View {
    
    var isLoggedIn: Bool
    private var tabBarView: TabBarView
    private var onboardingView: OnboardingView
    
    init(
    hasCompletedOnboarding: Bool,
    @ViewBuilder tabBarView: () -> TabBarView,
    @ViewBuilder onboardingView: () -> OnboardingView
    ) {
        self.isLoggedIn = hasCompletedOnboarding
        self.tabBarView = tabBarView()
        self.onboardingView = onboardingView()
    }
    
    var body: some View {
        ZStack {
            if isLoggedIn {
                tabBarView
                    .transition(AnyTransition.move(edge: .leading))
            } else {
                onboardingView
                    .transition(AnyTransition.move(edge: .trailing))
            }
        }
        .animation(Animation.easeInOut, value: self.isLoggedIn)
    }
}

struct AppView: View {
    
    @State var appState = AppStateViewModel()
    let userManager = UserManager(service: UserNetworkService())
    
    var body: some View {
        AppViewBuilder(
            hasCompletedOnboarding: appState.isLoggedIn,
            tabBarView: {
                TabBarView(userManager: userManager)
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
