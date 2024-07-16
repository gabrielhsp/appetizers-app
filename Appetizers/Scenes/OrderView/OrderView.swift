//
//  OrderView.swift
//  Appetizers
//
//  Created by Gabriel Pereira on 17/01/24.
//

import SwiftUI

struct OrderView: View {
    @State private var orderItems: [Appetizer] = MockData.orderItems
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    /// We're using a `ForEach` here to be able to use the delete swipe action
                    /// It's not available on a `List` element
                    ForEach(orderItems) { appetizer in
                        AppetizerListCell(appetizer: appetizer)
                    }
                    .onDelete(perform: deleteItems)
                }
                .listStyle(.plain)
                
                Button {
                    print("Order placed")
                } label: {
                    APButton(title: "$99.99 - Place Order")
                }
                .padding(.bottom, 25)
            }
            .navigationTitle("🧾 Orders")
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        orderItems.remove(atOffsets: offsets)
    }
}

#Preview {
    OrderView()
}
