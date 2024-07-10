//
//  NutritionInfoView.swift
//  Appetizers
//
//  Created by Gabriel Pereira on 09/07/24.
//

import SwiftUI

struct NutritionInfoView: View {
    let title: String
    let value: Int
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            
            Text("\(value)")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

#Preview {
    NutritionInfoView(title: "Calories", value: 99)
}
