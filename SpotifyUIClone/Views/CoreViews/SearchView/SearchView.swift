//
//  SearchView.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 4/1/26.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchViewModel: SearchViewModel
    @State private var searchText: String = ""
    
    init(container: DependencyContainer) {
        self._searchViewModel = State(
            wrappedValue: SearchViewModel(
                delegate: MockSearchHomeViewModelDelegate(
                    userDataSource: container.dependencies["UserManager"] as! UserManager
                )
            )
        )
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.spotifyBlack.ignoresSafeArea()
                
                VStack {
                    ScrollView(.vertical) {
                        LazyVStack(
                            spacing: 10,
                            pinnedViews: [.sectionHeaders]
                        ) {
                            header
                                .padding(.top, 10)
                                .padding(.horizontal, 16)
                            
                            Section {
                                ForEach(0..<10) { _ in
                                    Rectangle()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 300)
                                }
                            } header: {
                                
                                TextField(
                                    text: $searchText,
                                    prompt: Text("What do you want to listen to?")
                                        .foregroundStyle(Color.spotifyBlack)
                                    ,
                                    label: {
                                        Image(systemName: "magnifyingglass")
                                    }
                                )
                                .padding()
                                .background(Color.spotifyWhite)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .padding(.top, 10)
                                .padding(.bottom, 10)
                                .background(Color.spotifyBlack)
                            }
                            .padding(.horizontal, 16)
                        }
                    }
                    .clipped()
                }
            }
        }
    }
    
    private var header: some View {
        ProfileBarView(
            currentUser: searchViewModel.users.first) {
                HStack {
                    Text("Home")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.spotifyWhite)
                        .padding(.horizontal, 16)
                    Spacer()
                    Image(systemName: "camera")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                }
            }
    }
}

#Preview {
    SearchView(container: DependencyContainer())
}
