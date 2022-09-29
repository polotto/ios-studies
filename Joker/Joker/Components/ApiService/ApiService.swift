//
//  ApiService.swift
//  Joker
//
//  Created by Angelo Polotto on 26/09/22.
//

import Foundation

class ApiService: ApiServiceProtocol {
    //MARK: - parameters
    private let apiBaseUrl = "https://v2.jokeapi.dev/joke"
    private let headers = [
        "Content-Type": "application/json"
    ]
    private let networkService: NetworkServiceProtocol
    
    //MARK: - initializers
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func loadRandomJoke(_ resultData: @escaping (Result<Joke>) -> Void) {
        let url = apiBaseUrl + "/Programming,Pun,Christmas?blacklistFlags=nsfw,religious,political,racist,sexist,explicit&type=single"
        networkService.httpGet(with: Joke.self, url: url, headers: headers, completion: resultData)
    }
    
    func load10RandomJokes(_ resultData: @escaping (Result<Jokes>) -> Void) {
        let url = apiBaseUrl + "/Programming?blacklistFlags=nsfw,religious,political,racist,sexist,explicit&type=single&amount=10"
        networkService.httpGet(with: Jokes.self, url: url, headers: headers, completion: resultData)
    }
}
