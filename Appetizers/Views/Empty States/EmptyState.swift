//
//  EmptyState.swift
//  Appetizers
//
//  Created by Gabriel Pereira on 15/07/24.
//

import SwiftUI

struct EmptyState: View {
    let imageName: ImageResource
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
            }
        }
        .offset(y: -50)
    }
}

#Preview {
    EmptyState(imageName: .emptyOrder, 
               message: "This is our test message. I'm making it a little long for testing")
}
