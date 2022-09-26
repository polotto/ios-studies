//
//  CustomButton.swift
//  Joker
//
//  Created by Angelo Polotto on 26/09/22.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    var click: (() -> Void)?
    
    init() {
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    func initialize() {
        self.configuration = .filled()
        self.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    func setTitle(_ title: String) {
        self.setTitle(title, for: .normal)
    }
    
    @objc func buttonAction(sender: UIButton) {
        if let click = self.click {
            click()
            print("#CustomButton: " + (self.titleLabel?.text ?? ""))
        }
    }
}
