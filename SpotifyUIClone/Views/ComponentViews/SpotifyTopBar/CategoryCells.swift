//
//  CategoryCells.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 4/1/26.
//

import SwiftUI

struct CategoryCells: View {
    
    @State private var selectedCategory: Category = .all
    var paddingAmount: CGFloat = 0
    
    var body: some View {
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
            .padding(.horizontal, paddingAmount)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    CategoryCells()
}
