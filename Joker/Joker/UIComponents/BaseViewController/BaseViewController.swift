//
//  BaseViewController.swift
//  Joker
//
//  Created by Angelo Polotto on 27/09/22.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    //MARK: - properties
    var parameters: Any? = nil
    
    //MARK: - override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .AppLightTheme.background
        
        self.navigationController?.navigationBar.backgroundColor = .AppLightTheme.primary
        self.navigationController?.navigationBar.tintColor = .AppLightTheme.textOnPrimary
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.AppLightTheme.textOnPrimary]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    //MARK: - public method
    func isBusy(_ isBusy: Bool) {
        if isBusy {
            showLoading()
        } else {
            hideLoading()
        }
    }
    
    func addSubview(_ view: UIView) {
        self.view.addSubview(view)
    }
    
    //MARK: - private methods
    private func showLoading() {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating();

        alert.view.addSubview(loadingIndicator)
        
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    private func hideLoading() {
        DispatchQueue.main.async {
            self.dismiss(animated: false, completion: nil)
        }
    }
}
