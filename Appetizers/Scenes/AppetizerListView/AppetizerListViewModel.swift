//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Gabriel Pereira on 18/02/24.
//

import Observation
import SwiftUI

@MainActor
@Observable
final class AppetizerListViewModel: ObservableObject {
    var appetizers: [Appetizer] = []
    var alertItem: AlertItem?
    var isLoading: Bool = false
    var isShowingDetail: Bool = false
    var selectedAppetizer: Appetizer?
    
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
