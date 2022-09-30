//
//  ApiServiceProtocol.swift
//  Joker
//
//  Created by Angelo Polotto on 26/09/22.
//

import Foundation

protocol ApiServiceProtocol {
    func loadRandomJoke(_ resultData: @escaping (Result<Joke>) -> Void)
    func load10RandomJokes() async throws -> Jokes
}
