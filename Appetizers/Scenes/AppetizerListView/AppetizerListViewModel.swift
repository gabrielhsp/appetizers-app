//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Gabriel Pereira on 18/02/24.
//

import SwiftUI

@MainActor
final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    @Published var isShowingDetail: Bool = false
    @Published var selectedAppetizer: Appetizer?
    
    // MARK: - Internal Methods
    func getAppetizers() {
        isLoading = true
        
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                handleAppetizersError(error: error)
                isLoading = false
            }
        }
    }
    
    // MARK: - Private Methods
    private func handleAppetizersError(error: Error) {
        guard let error = error as? APError else {
            alertItem = AlertContext.invalidResponse
            return
        }
        
        switch error {
        case .invalidURL:
            alertItem = AlertContext.invalidURL
        case .invalidResponse:
            alertItem = AlertContext.invalidResponse
        case .invalidData:
            alertItem = AlertContext.invalidData
        case .unableToComplete:
            alertItem = AlertContext.unableToComplete
        }
    }
}
