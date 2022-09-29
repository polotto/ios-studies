//
//  MoreJoreTableViewCell.swift
//  Joker
//
//  Created by Angelo Polotto on 28/09/22.
//

import Foundation
import UIKit

class MoreJoreTableViewCell: UITableViewCell {
    //MARK: - properties
    static let identifier = "MoreJoreTableViewCell"
    private let joke = CustomLabel()
    
    
    //MARK: - initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.backgroundColor = .white
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - add ui elementes
    private func addUIElements() {
        addSubview(joke)
    }
    
    //MARK: - setup ui elements
    func setupUIElements(jokeTxt: String) {
        joke.setTitle(jokeTxt)
    }
    
    //MARK: - setupConstraints
    private func setupConstraints() {
        let defaultMargin = Values.defaultMargin.rawValue
        
        joke.addConstraint(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: defaultMargin, paddingLeft: defaultMargin, paddingBottom: defaultMargin, paddingRight: defaultMargin, width: defaultMargin, height: defaultMargin)
    }
}
