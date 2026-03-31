//
//  SettingsView.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/31/26.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(AppStateViewModel.self) var appState
    @Environment(\.dismiss) var dismiss
    
    @State var showLogOutAlert: Bool = false
    
    var body: some View {
        ZStack {
            Color.spotifyBlack
                .ignoresSafeArea()
            VStack {
                Button("Log out", action: { showLogOutAlert = true })
                .frame(width: 100, height: 40)
                .background(Color.spotifyWhite)
                .foregroundStyle(.spotifyBlack)
                .font(.headline)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .buttonStyle(.plain)
            }
        }
        .alert("Log Out", isPresented: $showLogOutAlert) {
            Button("Cancel", role: .cancel, action: {})
            Button("Log out", role: .none, action: {
                Task {
                    await logOut()
                }
            })
        } message: {
            Text("Are you sure you want to log out?")
        }

    }
    
    func logOut() async {
        
        dismiss()
        try? await Task.sleep(for: .seconds(0.5))
        
        appState.logOut()
    }
}

#Preview {
    SettingsView()
        .environment(AppStateViewModel())
}
