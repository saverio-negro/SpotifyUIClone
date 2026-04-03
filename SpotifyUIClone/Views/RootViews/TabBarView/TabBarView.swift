//
//  TabBarView.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/31/26.
//

import SwiftUI

struct TabBarView: View {
    
    let container: DependencyContainer
    
    var body: some View {
            TabView {
                Tab(
                    "Home",
                    systemImage: "house",
                    content: {
                        HomeView(container: container)
                    }
                )
                
                Tab(
                    "Search",
                    systemImage: "magnifyingglass",
                    content: {
                        SearchView(container: container)
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
    TabBarView(container: DependencyContainer())
}
