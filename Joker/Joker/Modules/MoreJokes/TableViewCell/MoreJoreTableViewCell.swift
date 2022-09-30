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
    private let divider = Divider()
    
    
    //MARK: - initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCell()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupCell()
    }
    
    private func setupCell() {
        addUIElements()
        setupUIElements()
        setupConstraints()
    }
    
    //MARK: - add ui elementes
    private func addUIElements() {
        addSubview(joke)
        addSubview(divider)
    }
    
    //MARK: - setup ui elements
    private func setupUIElements() {
        backgroundColor = .AppLightTheme.background
    }
    
    //MARK: - setupConstraints
    private func setupConstraints() {
        let defaultMargin = Values.defaultMargin.rawValue
        let containerView = self
        
        joke.addConstraint(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, paddingTop: defaultMargin, paddingLeft: defaultMargin, paddingBottom: defaultMargin, paddingRight: defaultMargin, width: 0, height: 0)
        
        divider.addConstraint(top: nil, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: Values.dividerHeight.rawValue)
    }
    
    //MARK: - setup data
    func setupData(jokeTxt: String) {
        joke.setTitleViewCell(jokeTxt)
    }
}
