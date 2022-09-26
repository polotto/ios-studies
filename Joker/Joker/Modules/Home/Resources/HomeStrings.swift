//
//  HomeStrings.swift
//  Joker
//
//  Created by Angelo Polotto on 26/09/22.
//

import Foundation

enum HomeStrings: String {
    case getJokeButton = "getJokeButton"
    
    func localized() -> String {
        rawValue.localized("HomeStrings")
    }
}
