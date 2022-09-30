//
//  Divider.swift
//  Joker
//
//  Created by Angelo Polotto on 29/09/22.
//

import Foundation
import UIKit

class Divider: UIView {
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
        backgroundColor = .AppLightTheme.primary
    }
}
