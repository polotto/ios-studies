//
//  CustomButton.swift
//  Joker
//
//  Created by Angelo Polotto on 26/09/22.
//

import Foundation
import UIKit

class CustomButton: UIButton {
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
        configuration = .filled()
        addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc private func buttonAction(sender: UIButton) {
        if let click = self.click {
            click()
            print("#CustomButton: " + (self.titleLabel?.text ?? ""))
        }
    }
    
    //MARK: - public methods
    func setTitle(_ title: String) {
        setTitle(title, for: .normal)
    }
}
