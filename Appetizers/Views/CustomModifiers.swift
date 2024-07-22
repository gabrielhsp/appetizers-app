//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Gabriel Pereira on 21/07/24.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}
