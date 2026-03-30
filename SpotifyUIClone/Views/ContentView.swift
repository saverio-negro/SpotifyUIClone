//
//  ContentView.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/29/26.
//

import SwiftUI

struct ContentView: View {
    
    let userViewModel = UserViewModel(
        delegate: MockUserViewModelDelegate(
            userDataSource: UserManager(service: UserNetworkService())))
    
    var body: some View {
        VStack {
            ScrollView {
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
