//
//  User.swift
//  Appetizers
//
//  Created by Gabriel Pereira on 12/07/24.
//

import Foundation

struct User: Codable {
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var birthdate: Date = Date()
    var extraNapkins: Bool = false
    var frequentRefills: Bool = false
}
