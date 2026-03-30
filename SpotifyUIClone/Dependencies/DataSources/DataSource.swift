//
//  DataSource.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/30/26.
//

import SwiftUI

protocol DataSource {
    associatedtype Data
    
    func getData() async -> [Data]
}
