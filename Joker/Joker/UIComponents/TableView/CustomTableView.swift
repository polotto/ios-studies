//
//  CustomTableView.swift
//  Joker
//
//  Created by Angelo Polotto on 29/09/22.
//

import Foundation
import UIKit

class CustomTableView: UITableView {
    //MARK: - initializers
    init() {
        super.init(frame: .zero, style: .plain)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    //MARK: - private methods
    private func initialize() {
        backgroundColor = .AppLightTheme.background
        estimatedRowHeight = UITableView.automaticDimension;
        rowHeight = UITableView.automaticDimension;
        separatorStyle = UITableViewCell.SeparatorStyle.none;
        allowsSelection = false
    }
    
    //MARK: - tableView setup
    func setup(delegate: UITableViewDelegate, dataSource: UITableViewDataSource,
               cellClass: AnyClass?, identifier: String) {
        self.delegate = delegate
        self.dataSource = dataSource
        register(cellClass, forCellReuseIdentifier: identifier)
    }
}
