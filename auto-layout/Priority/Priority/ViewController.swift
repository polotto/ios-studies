//
//  ViewController.swift
//  Priority
//
//  Created by Angelo Polotto on 31/01/20.
//  Copyright © 2020 Angelo Polotto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var papel: UIButton!
    @IBOutlet weak var ebook: UIButton!
    @IBOutlet weak var kindle: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTouchBook(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {
            switch sender.tag {
            case 0:
                if let b = self.ebook {
                    b.removeFromSuperview()
                }
                if let b = self.kindle {
                    b.removeFromSuperview()
                }
            case 1:
                if  let b = self.kindle {
                    b.removeFromSuperview()
                }
            case 2:
                if let b = self.ebook {
                    b.removeFromSuperview()
                }
            default:
                break
            }
            
            self.view.layoutIfNeeded()
        })
    }
    
}

