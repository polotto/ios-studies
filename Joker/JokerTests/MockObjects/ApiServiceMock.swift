//
//  ApiServiceMock.swift
//  JokerTests
//
//  Created by Angelo Polotto on 03/10/22.
//

import Foundation
@testable import Joker

class ApiServiceMock: ApiServiceProtocol {
    var loadRandomJoke: Result<Joke>!
    var load10RandomJokes: Result<Jokes>!
    
    func loadRandomJoke(_ resultData: @escaping (Result<Joke>) -> Void) {
        resultData(self.loadRandomJoke)
    }
    
    func load10RandomJokes() async throws -> Jokes {
        switch (load10RandomJokes) {
        case .success(let jokes):
            return jokes
        case .failure(let error):
            throw error
        case .none:
            throw ".none"
        }
    }
}
