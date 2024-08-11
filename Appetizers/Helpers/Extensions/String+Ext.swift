//
//  String+Ext.swift
//  Appetizers
//
//  Created by Sean Allen on 11/16/20.
//

import Foundation
import RegexBuilder

extension String {
    var isValidEmail: Bool {
        let emailRegex = Regex {
            // First parts of the RegEx matching the characters for the user on email
            OneOrMore {
                CharacterClass(
                    .anyOf("._%+-"),
                    ("A"..."Z"),
                    ("0"..."9"),
                    ("a"..."z")
                )
            }
            
            // Second part matching the presente of `@` character
            "@"
            
            // Third part matching the characters after the `@`
            OneOrMore {
                CharacterClass(
                    .anyOf("-"),
                    ("A"..."Z"),
                    ("a"..."z"),
                    ("0"..."9")
                )
            }
            
            // And finally matching the dot, where it's interesting to notice that we can have 2 dots after
            Repeat(1...2) {
                "."
                Repeat(2...64) {
                    CharacterClass(
                        ("A"..."Z"),
                        ("a"..."z")
                    )
                }
            }
        }
        
        return self.wholeMatch(of: emailRegex) != nil
    }
}
