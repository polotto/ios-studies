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
    private let messageService: MessageServiceProtocol
    
    //MARK: - local variables
    private var lastJoke: Joke?
    
    //MARK: - initializers
    init(apiService: ApiServiceProtocol, navigationService: NavigationServiceProtocol,
         messageService: MessageServiceProtocol) {
        self.apiService = apiService
        self.navigationService = navigationService
        self.messageService = messageService
    }
    
    //MARK: - bindings
    var joke: ((String, String) -> Void)?
    
    //MARK: - commands
    func receiveNewJoke() {
        isBusy?(true)
        apiService.loadRandomJoke { [self] result in
            switch result {
            case .success(let jokeObj):
                isBusy?(false)
                lastJoke = jokeObj
                self.joke?(jokeObj.joke, jokeObj.category)
            case .failure(let error):
                messageService.error(error.localizedDescription) {
                    self.isBusy?(false)
                }
                self.joke?(String(), String())
            }
        }
    }
    
    func moreJokes() {
        if (lastJoke != nil) {
            navigationService.push(MoreJokesViewModel.self, parameters: lastJoke)
        }
    }
}
