//
//  ViewController.swift
//  ConstraintsRuntimeUpdate
//
//  Created by Angelo Polotto on 01/02/20.
//  Copyright © 2020 Angelo Polotto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var blueViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var yellowViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var blueView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blueView.layer.cornerRadius = 20
    }

    @IBAction func didTapSwitchView(_ sender: UIButton) {
        UIView.animate(withDuration: 2) {
            if self.yellowViewLeadingConstraint.constant == 0 {
                self.yellowViewLeadingConstraint.constant = self.view.frame.width * -1
            } else {
                self.yellowViewLeadingConstraint.constant = 0
            }
            
            if self.blueViewTopConstraint.constant == 0 {
                self.blueViewTopConstraint.constant = self.view.frame.height * 0.4
            } else {
                self.blueViewTopConstraint.constant = 0
            }
            
            self.view.layoutIfNeeded()
        }
    }
}

