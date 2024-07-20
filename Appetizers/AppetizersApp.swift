//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Gabriel Pereira on 17/01/24.
//

import SwiftUI

@main
struct AppetizersApp: App {
    var order: Order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
                .environmentObject(order)
        }
    }
}
