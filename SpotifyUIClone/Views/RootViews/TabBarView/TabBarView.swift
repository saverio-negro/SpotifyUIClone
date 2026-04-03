//
//  TabBarView.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/31/26.
//

import SwiftUI

struct TabBarView: View {
    
    var body: some View {
            TabView {
                Tab(
                    "Home",
                    systemImage: "house",
                    content: {
                        HomeView()
                    }
                )
                
                Tab(
                    "Search",
                    systemImage: "magnifyingglass",
                    content: {
                        SearchView()
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
    TabBarView()
}
