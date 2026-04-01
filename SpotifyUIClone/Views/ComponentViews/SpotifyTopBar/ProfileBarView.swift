//
//  ProfileBarView.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/31/26.
//

import SwiftUI

struct ProfileBarView<Content: View>: View {
    
    @Binding var currentUser: User?
    @ViewBuilder var topBarContent: Content
    @State var showSettings: Bool = false
    
    var body: some View {
        HStack(spacing: 0) {
            
            // Profile Image
            ZStack {
                if let currentUser {
//                    ImageLoaderView(imageURLStr: currentUser.image)
//                        .background(Color.spotifyWhite)
//                        .clipShape(Circle())
//                        .onTapGesture {
//                            showSettings = true
//                        }
                    
                }
                Circle()
            }
            .frame(width: 35, height: 35)
            .shadow(color: .spotifyBlack, radius: 5, x: 5)
            
            // Top Bar Content
            topBarContent
            Spacer()
        }
        .fullScreenCover(isPresented: $showSettings, content: {
            SettingsView()
        })
    }
}

#Preview {
    
    @Bindable var userViewModel = UserViewModel(
        delegate: MockUserViewModelDelegate(
            userDataSource: UserManager(service: UserNetworkService())
        )
    )
    
    let userBinding = Binding {
        return userViewModel.users.first
    } set: { _ in
       
    }

    ProfileBarView(
        currentUser: userBinding,
        topBarContent: {
            Text("Home")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.spotifyWhite)
                .padding(.horizontal, 16)
        }
    )
    .task {
        await userViewModel.loadUsers()
    }
}
