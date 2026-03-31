//
//  SpotifyButton+PlainButton.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/31/26.
//

import SwiftUI

extension View {
    func spotifyButton(
        isCallToAction: Bool = false
    ) -> some View {
        return self.buttonStyle(
            SpotifyButton(
                isCallToAction: isCallToAction
            )
        )
    }
}

