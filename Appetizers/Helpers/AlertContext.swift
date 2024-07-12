//
//  AlertContext.swift
//  Appetizers
//
//  Created by Gabriel Pereira on 18/02/24.
//

import SwiftUI

struct AlertContext {
    // MARK: - Network Alert Contexts
    static let invalidURL = AlertItem(title: Text("Server Error"),
                                      message: Text("The data received from the server was invalid. Please, contact support."),
                                      dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                           message: Text("Invalid response from the server. Please try again or contact support."),
                                           dismissButton: .default(Text("OK")))
    
    static let invalidData = AlertItem(title: Text("Server Error"),
                                       message: Text("There was an issue connecting to the server. If this persists, please contact support."),
                                       dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unable to complete your request at this time. Please check your internet connection."),
                                            dismissButton: .default(Text("OK")))
    
    // MARK: - Account Alert Contexts
    static let invalidForm = AlertItem(title: Text("Invalid Form"),
                                       message: Text("Please ensure all fields in the form have been filled out."),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidEmail = AlertItem(title: Text("Invalid Email"),
                                        message: Text("Please ensure your email is correct."),
                                        dismissButton: .default(Text("OK")))
}
