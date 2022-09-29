//
//  MoreJokesViewModel.swift
//  Joker
//
//  Created by Angelo Polotto on 27/09/22.
//

import Foundation

class MoreJokesViewModel: BaseViewModel {
    //MARK: - properties
    private let lastJoke: Joke
    private let apiService: ApiServiceProtocol
    
    //MARK: - local data
    var jokes: [Joke]?
    
    //MARK: - initializers
    init(lastJoke: Joke, apiService: ApiService) {
        self.lastJoke = lastJoke
        self.apiService = apiService
    }

    func laterInit() {
        title?(lastJoke.category)
        
        //to be continued
//        apiService.load10RandomJokes()
    }
    
    //MARK: - bindings
    var title: ((String) -> Void)?
}
