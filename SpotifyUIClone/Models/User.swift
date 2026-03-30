//
//  User.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/30/26.
//

import SwiftUI

struct Users: Codable {
    let users: [User]
}

struct User: Identifiable, Hashable, Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let age: Int
    let gender: String
    let email: String
    let phone: String
    let username: String
    let password: String
    let image: String
    let birthDate: String
}

