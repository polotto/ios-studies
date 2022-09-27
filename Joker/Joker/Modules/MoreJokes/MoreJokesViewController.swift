//
//  MoreJokesViewController.swift
//  Joker
//
//  Created by Angelo Polotto on 27/09/22.
//

import Foundation
import UIKit

class MoreJokesViewController: BaseViewController {
    //MARK: - parameters
    private let jokeLabel = CustomLabel()
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addUIElements()
        setupUIElements()
        setupConstraints()
        setupBindings()
    }
    
    //MARK: - add ui elements
    func addUIElements() {
        addSubview(jokeLabel)
    }
    
    //MARK: - setup view
    func setupUIElements() {
        jokeLabel.setTitle(HomeStrings.noJokes.localized())
    }
    
    //MARK: - setup constraints
    func setupConstraints() {
        let margins = self.view.layoutMarginsGuide;
        let defaultMargins = CGFloat(10)
        let defaultHeight = CGFloat(30)
        
        jokeLabel.addConstraint(vertical: margins.centerYAnchor, left: margins.leftAnchor, right: margins.rightAnchor, paddingLeft: defaultMargins, paddingRight: defaultMargins, width: 0, height: 0)
        
    }
    
    //MARK: - setup bindings
    func setupBindings() {
        // vm dependencies
        let apiService = ApiService(networkService: NetworkService())
        
        // vm instance
        let vm = MoreJokesViewModel(apiService: apiService)
        
        // commands
        
        // binding creation
        vm.isBusy = super.isBusy
        
    }
}
