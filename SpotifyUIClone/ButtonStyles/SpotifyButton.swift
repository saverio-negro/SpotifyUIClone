//
//  SpotifyButton.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/31/26.
//

import SwiftUI

struct SpotifyButton: ButtonStyle {
    
    let isCallToAction: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .frame(height: 45)
            .background(
                Group {
                    if isCallToAction {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.spotifyGreen)
                    } else {
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.spotifyWhite, lineWidth: 1)
                    }
                }
            )
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundStyle(isCallToAction ? .spotifyBlack : .spotifyWhite)
            .brightness(0)
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
    }
}

