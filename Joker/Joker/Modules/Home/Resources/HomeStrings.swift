//
//  HomeStrings.swift
//  Joker
//
//  Created by Angelo Polotto on 26/09/22.
//

import Foundation

enum HomeStrings: String {
    case noJokes = "noJokes"
    case category = "category"
    case getJokeButton = "getJokeButton"
    case moreJokesButton = "moreJokesButton"
    
    func localized() -> String {
        rawValue.localized("HomeStrings")
    }
}
