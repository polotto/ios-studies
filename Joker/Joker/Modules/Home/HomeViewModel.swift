//
//  HomeViewModel.swift
//  Joker
//
//  Created by Angelo Polotto on 26/09/22.
//

import Foundation

class HomeViewModel: BaseViewModel {
    //MARK: - properties
    private let apiService: ApiServiceProtocol
    private let navigationService: NavigationServiceProtocol
    
    //MARK: - local variables
    private var lastJoke: Joke?
    
    //MARK: - initializers
    init(apiService: ApiServiceProtocol, navigationService: NavigationServiceProtocol) {
        self.apiService = apiService
        self.navigationService = navigationService
    }
    
    //MARK: - bindings
    var joke: ((String, String) -> Void)?
    
    //MARK: - commands
    func receiveNewJoke() {
        isBusy?(true)
        apiService.loadRandomJoke { [self] result in
            isBusy?(false)
            switch result {
            case .success(let jokeObj):
                lastJoke = jokeObj
                self.joke?(jokeObj.joke, jokeObj.category)
            case .failure(let error):
                self.joke?(error.localizedDescription, String())
            }
        }
    }
    
    func moreJokes() {
        if (lastJoke != nil) {
            navigationService.push(MoreJokesViewModel.self, parameters: lastJoke)
        }
    }
}
