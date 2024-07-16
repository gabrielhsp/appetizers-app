//
//  Appetizer.swift
//  Appetizers
//
//  Created by Gabriel Pereira on 19/01/24.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = createAppetizer(id: 0001)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let orderItems = [createAppetizer(id: 0001), createAppetizer(id: 0002), createAppetizer(id: 0003)]
    
    static func createAppetizer(id: Int) -> Appetizer {
        Appetizer(id: id,
                  name: "Test Appetizer \(id)",
                  description: "This is the description for my appetizer. It's yummy.",
                  price: 9.99,
                  imageURL: "",
                  calories: 99,
                  protein: 99,
                  carbs: 99)
    }
}
