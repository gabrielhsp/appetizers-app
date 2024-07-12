//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Gabriel Pereira on 11/07/24.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    // MARK: - Properties
    @AppStorage("user") private var userData: Data?
    @Published var user: User = User()
    @Published var alertItem: AlertItem?
    
    // MARK: - Computed Properties
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            presentAlertItem(forContext: AlertContext.invalidForm)
            return false
        }
        
        guard user.email.isValidEmail else {
            presentAlertItem(forContext: AlertContext.invalidEmail)
            return false
        }
        
        return true
    }
    
    // MARK: - Internal Methods
    func saveChanges() {
        guard isValidForm else {
            return
        }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            
            presentAlertItem(forContext: AlertContext.userSaveSuccess)
        } catch {
            presentAlertItem(forContext: AlertContext.invalidUserData)
        }
    }
    
    func retrieveUser() {
        guard let userData else {
            return
        }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            presentAlertItem(forContext: AlertContext.invalidUserData)
        }
    }
    
    // MARK: - Private Methods
    private func presentAlertItem(forContext alertItem: AlertItem) {
        DispatchQueue.main.async { [weak self] in
            self?.alertItem = alertItem
        }
    }
}
