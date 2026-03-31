//
//  ProfileBarView.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/31/26.
//

import SwiftUI

struct ProfileBarView<Content: View>: View {
    
    @ViewBuilder var content: Content
    @State var showSettings: Bool = false
    
    var body: some View {
        HStack(spacing: 10) {
            Circle()
                .frame(width: 40)
                .overlay {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.spotifyWhite)
                }
                .onTapGesture {
                    showSettings = true
                }
                .fullScreenCover(isPresented: $showSettings, content: {
                    SettingsView()
                })
            content
            Spacer()
        }
    }
}

#Preview {
    ProfileBarView(content: { Text("Title") })
}
