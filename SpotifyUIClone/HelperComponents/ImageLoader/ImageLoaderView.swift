//
//  ImageLoaderView.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 3/29/26.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    
    private var imageURLStr: String = Constants.randomImageURL
    private var resizingMode: ContentMode = ContentMode.fill
    
    init(imageURLStr: String = Constants.randomImageURL,
         resizingMode: ContentMode = .fill
    ) {
        self.imageURLStr = imageURLStr
        self.resizingMode = resizingMode
    }
    
    var body: some View {
        Rectangle()
            .overlay {
                WebImage(url: URL(string: imageURLStr))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizingMode)
                
                // Prevents the view from participating
                // in hit test operations.
                
                // Reason: `WebImage` view pours out
                // of the boundary of the parent view's
                // rectangular frame because of the
                // content mode constraint.
                    .allowsHitTesting(false)
            }
            .clipped()
    }
}

#Preview {
    ImageLoaderView()
}
