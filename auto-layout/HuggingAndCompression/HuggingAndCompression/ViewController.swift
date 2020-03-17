//
//  ViewController.swift
//  HuggingAndCompression
//
//  Created by Angelo Polotto on 01/02/20.
//  Copyright © 2020 Angelo Polotto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var shortTitle1: UILabel!
    @IBOutlet weak var shortMsg1: UILabel!
    @IBOutlet weak var shortTitle2: UILabel!
    @IBOutlet weak var shortMsg2: UILabel!
    @IBOutlet weak var shortTitle3: UILabel!
    @IBOutlet weak var shortMsg3: UILabel!
    
    @IBOutlet weak var longTitle1: UILabel!
    @IBOutlet weak var longMsg1: UILabel!
    @IBOutlet weak var longTitle2: UILabel!
    @IBOutlet weak var longMsg2: UILabel!
    @IBOutlet weak var longTitle3: UILabel!
    @IBOutlet weak var longMsg3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let shortTitle = "Udemy"
        let shortMsg = "Thanksgiving sale now"
        
        shortTitle1.text = shortTitle
        shortMsg1.text = shortMsg
        shortTitle2.text = shortTitle
        shortMsg2.text = shortMsg
        shortTitle3.text = shortTitle
        shortMsg3.text = shortMsg
        
        let longTitle = "Udemy thanksgiving Udemy thanksgiving"
        let longMsg = "courses start at $9.99 courses start at $9.99"
        longTitle1.text = longTitle
        longMsg1.text = longMsg
        longTitle2.text = longTitle
        longMsg2.text = longMsg
        longTitle3.text = longTitle
        longMsg3.text = longMsg
    }


}

