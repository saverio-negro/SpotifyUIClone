//
//  CategoryCell.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 4/1/26.
//

import SwiftUI

struct CategoryCell: View {
    
    let title: String
    var isSelected: Bool = false
    
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 35)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .background(isSelected ? Color.spotifyGreen : Color.spotifyDarkGray)
            .foregroundStyle(isSelected ? Color.spotifyBlack : Color.spotifyWhite)
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    
    @Previewable @State var selectedCategory: Category = .all
    
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        ScrollView(.horizontal) {
            HStack {
                ForEach(Category.allCases, id: \Category.self) { category in
                    CategoryCell(
                        title: category.rawValue.capitalized,
                        isSelected: selectedCategory == category
                    )
                    .onTapGesture {
                        selectedCategory = category
                    }
                }
            }
        }
    }
}
