//
//  Order.swift
//  Appetizers
//
//  Created by Gabriel Pereira on 19/07/24.
//

import SwiftUI

final class Order: ObservableObject {
    // MARK: - Properties
    @Published var items: [Appetizer] = []
    
    // MARK: - Computed Properties
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    // MARK: - Methods
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
