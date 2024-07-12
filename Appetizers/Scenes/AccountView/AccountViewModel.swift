//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Gabriel Pereira on 11/07/24.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    // MARK: - Properties
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var birthdate: Date = Date()
    @Published var extraNapkins: Bool = false
    @Published var frequentRefills: Bool = false
    @Published var alertItem: AlertItem?
    
    // MARK: - Computed Properties
    var isValidForm: Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            handleFormErrors(forContext: AlertContext.invalidForm)
            return false
        }
        
        guard email.isValidEmail else {
            handleFormErrors(forContext: AlertContext.invalidEmail)
            return false
        }
        
        return true
    }
    
    // MARK: - Internal Methods
    func saveChanges() {
        guard isValidForm else {
            return
        }
        
        print("Changes have been saved successfully")
    }
    
    // MARK: - Private Methods
    private func handleFormErrors(forContext alertItem: AlertItem) {
        DispatchQueue.main.async { [weak self] in
            self?.alertItem = alertItem
        }
    }
}
