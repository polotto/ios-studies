//
//  HomeViewModel.swift
//  Joker
//
//  Created by Angelo Polotto on 26/09/22.
//

import Foundation

class HomeViewModel {
    //MARK: - properties
    private let apiService: ApiService
    
    //MARK: - initializers
    init(apiService: ApiService) {
        self.apiService = apiService
    }
    
    //MARK: - bindings
    var joke : (() -> Void)?
    
    //MARK: - commands
    func receiveNewJoke() {
        
    }
}
