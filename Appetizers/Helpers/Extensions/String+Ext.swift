//
//  String+Ext.swift
//  Appetizers
//
//  Created by Sean Allen on 11/16/20.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        let emailFormat: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate: NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        
        return emailPredicate.evaluate(with: self)
    }
}
