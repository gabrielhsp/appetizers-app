//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Gabriel Pereira on 18/02/24.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    
    // MARK: - Internal Methods
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    self.handleAppetizersError(error: error)
                }
            }
        }
    }
    
    // MARK: - Private Methods
    private func handleAppetizersError(error: APError) {
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
