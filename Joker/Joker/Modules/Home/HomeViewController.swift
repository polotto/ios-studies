//
//  ViewController.swift
//  Joker
//
//  Created by Angelo Polotto on 21/09/22.
//

import UIKit

class HomeViewController: BaseViewController {
    //MARK: - parameters
    private let jokeLabel = CustomLabel()
    private let categoryLabel = CustomLabel()
    private let getJokeButton = CustomButton()
    private let moreJokesButton = CustomButton()
    
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
        addSubview(categoryLabel)
        addSubview(getJokeButton)
        addSubview(moreJokesButton)
    }
    
    //MARK: - setup view
    private func setupUIElements() {
        title = HomeStrings.title.localized()
        jokeLabel.setTitle(HomeStrings.noJokes.localized())
        categoryLabel.setTitle(String())
        getJokeButton.setTitle(HomeStrings.getJokeButton.localized())
        moreJokesButton.setTitle(HomeStrings.moreJokesButton.localized())
    }
    
    //MARK: - setup constraints
    private func setupConstraints() {
        let margins = self.view.layoutMarginsGuide;
        let defaultMargins = Values.defaultMargin.rawValue
        let defaultHeight = Values.defaultHeight.rawValue
        
        jokeLabel.addConstraint(vertical: margins.centerYAnchor, left: margins.leftAnchor, right: margins.rightAnchor, paddingLeft: defaultMargins, paddingRight: defaultMargins, width: 0, height: 0)
        
        categoryLabel.addConstraint(top: jokeLabel.bottomAnchor, left: margins.leftAnchor, bottom: getJokeButton.topAnchor, right: margins.rightAnchor, paddingTop: defaultMargins, paddingLeft: defaultMargins, paddingBottom: defaultMargins, paddingRight: defaultMargins, width: 0, height: 0)
        
        getJokeButton.addConstraint(top: nil, left: margins.leftAnchor, bottom: moreJokesButton.topAnchor, right: margins.rightAnchor, paddingTop: 0, paddingLeft: defaultMargins, paddingBottom: defaultMargins, paddingRight: defaultMargins, width: 0, height: defaultHeight)
        
        moreJokesButton.addConstraint(top: nil, left: margins.leftAnchor, bottom: margins.bottomAnchor, right: margins.rightAnchor, paddingTop: 0, paddingLeft: defaultMargins, paddingBottom: defaultMargins, paddingRight: defaultMargins, width: 0, height: defaultHeight)
        
    }
    
    //MARK: - setup bindings
    private func setupBindings() {
        // vm dependencies
        let apiService = ApiService(networkService: NetworkService())
        let navigationService = NavigationService()
        
        // vm instance
        let vm = HomeViewModel(apiService: apiService, navigationService: navigationService)
        
        // commands
        getJokeButton.click = vm.receiveNewJoke
        moreJokesButton.click = vm.moreJokes
        
        // binding creation
        vm.isBusy = super.isBusy
        
        vm.joke = { text, catetory in
            self.jokeLabel.setTitle(text)
            self.categoryLabel.setTitle(HomeStrings.category.localized() + catetory)
        }
    }
}
