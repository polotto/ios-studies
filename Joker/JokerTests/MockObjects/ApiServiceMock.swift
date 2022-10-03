//
//  ApiServiceMock.swift
//  JokerTests
//
//  Created by Angelo Polotto on 03/10/22.
//

import Foundation
@testable import Joker

class ApiServiceMock: ApiServiceProtocol {
    private var loadRandomJoke: Result<Joke>!
    private var load10RandomJokes: Result<Jokes>!
    
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
    
    private func setupData<T: Codable>(objectType: T.Type, file: String) throws -> T {
        guard let pathString = Bundle(for: type(of: self)).path(forResource: file, ofType: "json") else {
            fatalError("UnitTestData.json not found")
        }
        
        guard let jsonString = try? String(contentsOfFile: pathString, encoding: .utf8) else {
            fatalError("Unable to convert UnitTestData.json to String")
        }
        
        let jsonData: Data? = jsonString.data(using: .utf8)
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(objectType.self, from: jsonData!)
        return decoded
    }
    
    func setupLoadRandomJoke() throws {
        loadRandomJoke = .success(try setupData(objectType: Joke.self, file: "get_joke"))
    }
    
    func setupLoad10RandomJokes() throws {
        load10RandomJokes = .success(try setupData(objectType: Jokes.self, file: "get_10_jokes"))
    }
    
    func setupFailLoadRandomJoke() -> RequestError {
        let requestError = RequestError.networkError(NSError())
        loadRandomJoke = .failure(requestError)
        return requestError
    }
    
    func setupFailLoad10RandomJokes() -> RequestError {
        let requestError = RequestError.networkError(NSError())
        load10RandomJokes = .failure(requestError)
        return requestError
    }
}
