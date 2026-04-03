//
//  HomeView.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/31/26.
//

import SwiftUI

struct HomeView: View {
    
    @State private var homeViewModel: HomeViewModel
    
    init<DS: DataSource>(userManager: DS) {
        self._homeViewModel = State(
            wrappedValue: HomeViewModel(
                delegate: MockHomeViewModelDelegate(
                    userDataSource: userManager
                )
            )
        )
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.spotifyBlack
                    .ignoresSafeArea()
                
                VStack {
                    header
                        .padding(.top, 10)
                        .padding(.leading, 16)
                    VStack {
                        ScrollView(.vertical) {
                            LazyVStack(spacing: 10) {
                                ForEach(0..<10) { _ in
                                    Rectangle()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 300)
                                }
                                .padding(16)
                            }
                        }
                    }
                }
            }
        }
        .task {
            await homeViewModel.loadUsers()
        }
    }
    
    private var header: some View {
        ProfileBarView(
            currentUser: homeViewModel.users.first,
            topBarContent: {
                CategoryCells(paddingAmount: 16)
            }
        )
    }
}

#Preview {
    HomeView(
        userManager: UserManager(service: UserNetworkService())
    )
}
