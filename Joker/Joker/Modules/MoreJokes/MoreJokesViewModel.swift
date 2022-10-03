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
    private let messageService: MessageServiceProtocol
    
    //MARK: - local data
    var jokes: Jokes?
    
    //MARK: - initializers
    init(lastJoke: Joke, apiService: ApiServiceProtocol, messageService: MessageServiceProtocol) {
        self.lastJoke = lastJoke
        self.apiService = apiService
        self.messageService = messageService
    }

    func laterInit() {
        title?(lastJoke.category)
        
        self.isBusy?(true)
        
        Task {
            do {
                self.jokes = try await self.apiService.load10RandomJokes()
                self.reloadData?()
                self.isBusy?(false)
            } catch {
                let err = error as? RequestError
                await messageService.error(err?.description ?? RequestError.unknown.description)
                self.reloadData?()
                self.isBusy?(false)
            }
        }
    }
    
    //MARK: - bindings
    var title: ((String) -> Void)?
    var reloadData: (() -> Void)?
}
