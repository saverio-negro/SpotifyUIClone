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
                        SpotifyHomeView()
                    }
                )
                
                Tab(
                    "Search",
                    systemImage: "magnifyingglass",
                    content: {
                    }
                )
                
                Tab(
                    "Search",
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
    }
}

#Preview {
    TabBarView()
}
