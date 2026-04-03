//
//  AppViewBuilder.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 4/3/26.
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
