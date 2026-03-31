//
//  SpotifyHomeView.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/31/26.
//

import SwiftUI

struct SpotifyHomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.spotifyBlack
                    .ignoresSafeArea()
                
                VStack {
                    ProfileBarView(content: {
                        Text("Home")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.spotifyWhite)
                    })
                    Spacer()
                }
                .padding()
            }
        }
    }
}

#Preview {
    SpotifyHomeView()
}
