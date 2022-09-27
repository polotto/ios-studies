//
//  MoreJokesViewModel.swift
//  Joker
//
//  Created by Angelo Polotto on 27/09/22.
//

import Foundation

class MoreJokesViewModel: BaseViewModel {
    //MARK: - properties
    private let apiService: ApiServiceProtocol
    
    //MARK: - initializers
    init(apiService: ApiService) {
        self.apiService = apiService
    }
}
