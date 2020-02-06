//
//  ViewController.swift
//  VisualFormatLanguage
//
//  Created by Angelo Polotto on 01/02/20.
//  Copyright © 2020 Angelo Polotto. All rights reserved.
//

import UIKit

enum Padding {
    static let `default`: CGFloat = 20.0
}

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    let mainButton = UIButton()
    let myView = UIView()
    var viewConstraints = [NSLayoutConstraint]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "Visual format language"
        titleLabel.backgroundColor = UIColor.yellow
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40.0).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0.0).isActive = true
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
        myView.translatesAutoresizingMaskIntoConstraints = false
        
        myView.layer.borderWidth = 1.0
        myView.layer.borderColor = UIColor.gray.cgColor
        
        self.view.addSubview(myView)
        
        myView.topAnchor.constraint(equalTo: mainButton.bottomAnchor, constant: 40.0).isActive = true
        myView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0).isActive = true
        myView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0).isActive = true
        myView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -40.0).isActive = true
    }
    
    override func viewSafeAreaInsetsDidChange() {
        // workaround to implement safeArea with Visual Format Language
        
        // if have some constraing, remove all to re-insert
        if !view.constraints.isEmpty {
            NSLayoutConstraint.deactivate(viewConstraints)
            viewConstraints.removeAll()
        }
        
        let safeAreaInsets = view.safeAreaInsets
        let leftInset = safeAreaInsets.left > 0 ? safeAreaInsets.left : Padding.default
        let rightInset = safeAreaInsets.right > 0 ? safeAreaInsets.right : Padding.default
        let topInset = safeAreaInsets.top > 0 ? safeAreaInsets.top : Padding.default
        let bottomtInset = safeAreaInsets.bottom > 0 ? safeAreaInsets.bottom : Padding.default
        
        let viewsDict: [String: Any] = [
            "titleLabel": titleLabel!,
            "mainButton": mainButton,
            "myView": myView,
            "view": view!
        ]
        
        let metrics: [String: CGFloat] = [
            "defaultPadding": Padding.default,
            "leftInset": leftInset,
            "rightInset": rightInset,
            "topInset": topInset,
            "bottomtInset": bottomtInset
        ]
        
        let verticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-topInset-[titleLabel]-40-[mainButton]-40-[myView]-bottomtInset-|",
            options: [.alignAllCenterX], // sempre funciona perpendicular ao sentido, para centralizar em X, precisa conficurar no Vertical
            metrics: metrics,
            views: viewsDict)
        viewConstraints += verticalConstraints
        
        let mainButtonHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-leftInset-[mainButton]-rightInset-|", options: [], metrics: metrics, views: viewsDict)
        viewConstraints += mainButtonHorizontalConstraints
        
        let myViewHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-leftInset-[myView]-rightInset-|", options: [], metrics: metrics, views: viewsDict)
        viewConstraints += myViewHorizontalConstraints
        
        NSLayoutConstraint.activate(viewConstraints)
    }
    
    @objc func buttonAction(sender: UIButton) {
        print("\(String(describing: sender.titleLabel?.text)) is tapped")
    }
}

