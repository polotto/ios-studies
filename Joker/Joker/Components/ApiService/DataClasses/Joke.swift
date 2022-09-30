//
//  Joke.swift
//  Joker
//
//  Created by Angelo Polotto on 26/09/22.
//

import Foundation

struct Joke: Codable {
    let error: Bool?
    let category, type, joke: String
    let flags: Flags
    let id: Int
    let safe: Bool
    let lang: String
    
    init() {
        error = false
        category = String()
        type = String()
        joke = String()
        flags = Flags()
        id = 0
        safe = false
        lang = String()
    }
}
