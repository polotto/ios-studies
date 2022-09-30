//
//  MessageService.swift
//  Joker
//
//  Created by Angelo Polotto on 29/09/22.
//

import Foundation
import UIKit

class MessageService: MessageServiceProtocol {
    func error(_ message: String, dismissed: @escaping () -> Void) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: MessageStrings.titleError.localized(), message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: MessageStrings.okError.localized(), style: .default, handler: { _ in
                dismissed()
            }))
            
            if let topViewController = UIApplication.getTopViewController() {
                topViewController.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func error(_ message: String) async {
        return await withCheckedContinuation { (continuation: CheckedContinuation<Void, Never>) in
            DispatchQueue.main.async {
                let alert = UIAlertController(title: MessageStrings.titleError.localized(), message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: MessageStrings.okError.localized(), style: .default, handler: { _ in
                    continuation.resume()
                }))
                
                if let topViewController = UIApplication.getTopViewController() {
                    topViewController.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
}
