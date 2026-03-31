//
//  ContentView.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/29/26.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    
    @State var userViewModel = UserViewModel(
        delegate: MockUserViewModelDelegate(
            userDataSource: UserManager(service: UserNetworkService())))
    
    var body: some View {
        NavigationStack {
            VStack {
                ForEach(userViewModel.users) { user in
                    Text("\(user.firstName) \(user.lastName)")
                }
            }
        }
        .task {
            await userViewModel.loadUsers()
        }
    }
}

#Preview {
    ContentView()
}
