//
//  MessageStrings.swift
//  Joker
//
//  Created by Angelo Polotto on 29/09/22.
//

import Foundation

enum MessageStrings: String {
    case titleError = "titleError"
    case okError = "okError"
    
    func localized() -> String {
        rawValue.localized("MessageStrings")
    }
}
