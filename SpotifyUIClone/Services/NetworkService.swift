//
//  NetworkService.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/30/26.
//

import SwiftUI

protocol NetworkService {
    associatedtype Data
    
    func getData() async throws -> [Data]
}
