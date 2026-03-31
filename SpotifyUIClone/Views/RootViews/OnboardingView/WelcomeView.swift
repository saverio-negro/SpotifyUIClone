//
//  WelcomeView.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/31/26.
//

import SwiftUI

struct WelcomeView: View {
    
    @Environment(AppStateViewModel.self) var appState
    @State var isLoggingIn: Bool = false
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                Color.spotifyBlack
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    
                    VStack {
                        Image(.spotifyLogoWhite)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .padding()
                        
                        Text("Millions of songs.")
                        Text("Free on Spotify.")
                    }
                    .foregroundStyle(.spotifyWhite)
                    .font(.title)
                    .fontWeight(.bold)
                    
                    Spacer()
                    
                    VStack {
                        Button("Sign up free", action: signUp)
                            .spotifyButton(isCallToAction: true)
                        Button("Log in", action: {
                            Task {
                                await logIn()
                            }
                        })
                        .spotifyButton()
                    }
                }
                .padding()
            }
            .overlay {
                if isLoggingIn {
                    
                    VStack {
                        
                        Spacer()
                        Spacer()
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 130, height: 130)
                            .opacity(0.05)
                            .overlay {
                                Image(systemName: "headphones.dots")
                                    .resizable()
                                    .scaledToFit()
                                    .symbolEffect(.bounce)
                                    .padding(30)
                            }
                        Spacer()
                    }
                }
            }
            .disabled(isLoggingIn)
        }
    }
    
    func signUp() {
        
    }
    
    func logIn() async {
        
        isLoggingIn = true
        try? await Task.sleep(for: .seconds(1))
        isLoggingIn = false
        
        appState.logIn()
    }
}

#Preview {
    WelcomeView()
        .environment(AppStateViewModel())
}
