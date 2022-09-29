//
//  MoreJokesViewController.swift
//  Joker
//
//  Created by Angelo Polotto on 27/09/22.
//

import Foundation
import UIKit

class MoreJokesViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    //MARK: - parameters
    private var vm: MoreJokesViewModel?
    private let jokesTableView = UITableView(frame: .zero, style: .plain)
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addUIElements()
        setupUIElements()
        setupConstraints()
        setupBindings()
    }
    
    //MARK: - add ui elements
    private func addUIElements() {
        addSubview(jokesTableView)
    }
    
    //MARK: - setup view
    private func setupUIElements() {
        jokesTableView.delegate = self
        jokesTableView.dataSource = self
        jokesTableView.register(MoreJoreTableViewCell.self, forCellReuseIdentifier: MoreJoreTableViewCell.identifier)
    }
    
    //MARK: - setup constraints
    private func setupConstraints() {
        let margins = self.view.layoutMarginsGuide;
        
        jokesTableView.addConstraint(top: margins.topAnchor, left: margins.leftAnchor, bottom: margins.bottomAnchor, right: margins.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
    }
    
    //MARK: - setup bindings
    private func setupBindings() {
        // vm dependencies
        let apiService = ApiService(networkService: NetworkService())
        let lastJoke = parameters as? Joke ?? Joke()
        
        // vm instance
        vm = MoreJokesViewModel(lastJoke: lastJoke, apiService: apiService)
        
        // commands
        
        // binding creation
        vm?.isBusy = super.isBusy
        vm?.title = { category in
            self.title = MoreJokesStrings.title.localized() + category
        }
        
        // call later init
        vm?.laterInit()
    }
    
    //MARK: - tableView implementations
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm?.jokes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MoreJoreTableViewCell.identifier, for: indexPath) as? MoreJoreTableViewCell else { return UITableViewCell() }
        
        let row = indexPath.row
        
        cell.setupUIElements(jokeTxt: vm?.jokes?[row].joke ?? String())
        
        return cell
    }
}
