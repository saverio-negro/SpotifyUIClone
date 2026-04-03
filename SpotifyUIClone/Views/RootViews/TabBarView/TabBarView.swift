//
//  TabBarView.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/31/26.
//

import SwiftUI

struct TabBarView: View {
    
    let userManager: UserManager
    
    var body: some View {
            TabView {
                Tab(
                    "Home",
                    systemImage: "house",
                    content: {
                        HomeView(userManager: userManager)
                    }
                )
                
                Tab(
                    "Search",
                    systemImage: "magnifyingglass",
                    content: {
                        SearchView(userManager: userManager)
                    }
                )
                
                Tab(
                    "Your Library",
                    systemImage: "books.vertical",
                    content: {
                    }
                )
                
                Tab(
                    "Create",
                    systemImage: "plus",
                    content: {
                        
                    }
                )
            }
            .tint(.spotifyWhite)
            .toolbarVisibility(.hidden, for: .navigationBar)
    }
}

#Preview {
    TabBarView(
        userManager: UserManager(service: UserNetworkService())
    )
}
