//
//  ViewController.swift
//  LayoutAnchor
//
//  Created by Angelo Polotto on 01/02/20.
//  Copyright © 2020 Angelo Polotto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var programaticLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        programaticLabel.text = "Layout Anchor"
        programaticLabel.backgroundColor = UIColor.yellow
        programaticLabel.translatesAutoresizingMaskIntoConstraints = false
        
        programaticLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40.0).isActive = true
        programaticLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0.0).isActive = true
        
        let mainButton = UIButton()
        mainButton.translatesAutoresizingMaskIntoConstraints = false
        
        mainButton.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.size.width - 40.0, height: 40.0)
        mainButton.backgroundColor = UIColor.blue
        mainButton.layer.borderWidth = 2
        mainButton.layer.borderColor = UIColor.red.cgColor
        mainButton.layer.cornerRadius = 5
        mainButton.setTitle("Main button", for: UIControl.State())
        mainButton.setTitleColor(UIColor.white, for: UIControl.State())
        mainButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 20.0)
        mainButton.addTarget(self, action: #selector(ViewController.buttonAction(sender:)), for: .touchUpInside)
        
        self.view.addSubview(mainButton)
        
        mainButton.topAnchor.constraint(equalTo: programaticLabel.bottomAnchor, constant: 40.0).isActive = true
        mainButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0).isActive = true
        mainButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0).isActive = true
        
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        
        myView.layer.borderWidth = 1.0
        myView.layer.borderColor = UIColor.gray.cgColor
        
        self.view.addSubview(myView)
        
        myView.topAnchor.constraint(equalTo: mainButton.bottomAnchor, constant: 40.0).isActive = true
        myView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0).isActive = true
        myView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0).isActive = true
        myView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -40.0).isActive = true
    }
    
    @objc func buttonAction(sender: UIButton) {
        print("\(String(describing: sender.titleLabel?.text)) is tapped")
    }
}

