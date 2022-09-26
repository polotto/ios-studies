//
//  ConstraintHelper.swift
//  Joker
//
//  Created by Angelo Polotto on 26/09/22.
//

import Foundation
import UIKit

extension UIView {
    func addConstraint(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?,
                       bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?,
                       paddingTop: CGFloat, paddingLeft: CGFloat,
                       paddingBottom: CGFloat, paddingRight: CGFloat,
                       width: CGFloat, height: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // Use the top parameter to set the top constarint
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        // Use the left parameter to set the left constarint
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        // Use the bottom parameter to set the bottom constarint
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        // Use the right parameter to set the right constarint
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        // Use the width parameter to set the top constarint
        if width != 0 {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        // Use the height parameter to set the top constarint
        if height != 0 {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func addConstraint(vertical: NSLayoutYAxisAnchor?, horizontal: NSLayoutXAxisAnchor?,
                       width: CGFloat, height: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // Use the vertical parameter to set the bottom constarint
        if let vertical = vertical {
            self.centerYAnchor.constraint(equalTo: vertical).isActive = true
        }
        // Use the horizontal parameter to set the right constarint
        if let horizontal = horizontal {
            self.rightAnchor.constraint(equalTo: horizontal).isActive = true
        }
        // Use the width parameter to set the top constarint
        if width != 0 {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        // Use the height parameter to set the top constarint
        if height != 0 {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
