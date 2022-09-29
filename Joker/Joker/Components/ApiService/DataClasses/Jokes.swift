//
//  Jokes.swift
//  Joker
//
//  Created by Angelo Polotto on 28/09/22.
//

import Foundation

struct Jokes: Codable {
    let error: Bool
    let amount: Int
    let jokes: [Joke]
    
    init() {
        error = false
        amount = 0
        jokes = []
    }
}
