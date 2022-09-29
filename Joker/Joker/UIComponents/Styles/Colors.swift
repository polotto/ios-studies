//
//  Colors.swift
//  Joker
//
//  Created by Angelo Polotto on 28/09/22.
//

import Foundation
import UIKit

extension UIColor {
    struct AppLightTheme {
        static var primary: UIColor  { return UIColor(rgb: 0xF44336) }
        static var secondary: UIColor { return UIColor(rgb: 0xE57373) }
        static var background: UIColor { return UIColor(rgb: 0xFFEBEE) }
        static var error: UIColor { return UIColor(rgb: 0xB71C1C) }
        static var textOnBackground: UIColor { return UIColor(rgb: 0x000000) }
        static var textOnPrimary: UIColor { return UIColor(rgb: 0xFFFFFF) }
        static var textOnSecondary: UIColor { return UIColor(rgb: 0x000000) }
        static var textOnError: UIColor { return UIColor(rgb: 0xFFFFFF) }
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(rgb: Int) {
        self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
        )
    }
}
