//
//  CustomLabel.swift
//  Joker
//
//  Created by Angelo Polotto on 27/09/22.
//

import Foundation
import UIKit

class CustomLabel: UILabel {
    //MARK: - clousures
    var click: (() -> Void)?
    
    //MARK: - initializers
    init() {
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    //MARK: - private methods
    private func initialize() {
        textAlignment = .center
        lineBreakMode = .byWordWrapping
        numberOfLines = 0
//        font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        font = font.withSize(25)
        textColor = .AppLightTheme.textOnBackground
    }
    
    //MARK: - public methods
    func setTitle(_ text: String) {
        DispatchQueue.main.async{
            self.text = text
        }
    }
}
