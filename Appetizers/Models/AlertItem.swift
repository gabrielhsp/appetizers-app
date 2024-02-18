//
//  AlertItem.swift
//  Appetizers
//
//  Created by Gabriel Pereira on 18/02/24.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}
