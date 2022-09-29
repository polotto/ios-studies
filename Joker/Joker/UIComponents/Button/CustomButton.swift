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
//        configuration = .plain()
        backgroundColor = .AppLightTheme.primary
        setTitleColor(.AppLightTheme.textOnPrimary, for: .normal)
        addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        addTarget(self, action: #selector(buttonColorManager), for: .touchDown)
    }
    
    @objc private func buttonAction(sender: UIButton) {
        sender.backgroundColor =  .AppLightTheme.primary
        setTitleColor(.AppLightTheme.textOnPrimary, for: .normal)
        
        if let click = self.click {
            click()
            print("#CustomButton: " + (self.titleLabel?.text ?? ""))
        }
    }
    
    @objc private func buttonColorManager(sender: UIButton) {
        sender.backgroundColor =  .AppLightTheme.secondary
        setTitleColor(.AppLightTheme.textOnSecondary, for: .normal)
    }
    
    //MARK: - public methods
    func setTitle(_ title: String) {
        setTitle(title, for: .normal)
    }
}
