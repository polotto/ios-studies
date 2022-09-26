//
//  ViewController.swift
//  Joker
//
//  Created by Angelo Polotto on 21/09/22.
//

import UIKit

class HomeViewController: UIViewController {
    let getJokeButton = CustomButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUIElements()
        addUIElements()
        setupConstraints()
    }
    
    //MARK: - setup view
    func setupUIElements() {
        self.view.backgroundColor = .red
        
        getJokeButton.setTitle(HomeStrings.getJokeButton.localized())
        getJokeButton.click = {
            
        }
    }
    
    //MARK: - add ui elements
    func addUIElements() {
        self.view.addSubview(getJokeButton)
    }
    
    //MARK: - setup constraints
    func setupConstraints() {
        let margins = self.view.layoutMarginsGuide;
        
        getJokeButton.addConstraint(top: nil, left: margins.leftAnchor, bottom: margins.bottomAnchor, right: margins.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 10, paddingRight: 10, width: 0, height: 30)
        
    }
}
