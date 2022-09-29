//
//  MoreJokesStrings.swift
//  Joker
//
//  Created by Angelo Polotto on 28/09/22.
//

import Foundation

enum MoreJokesStrings: String {
    case title = "title"
    
    func localized() -> String {
        rawValue.localized("MoreJokesStrings")
    }
}
