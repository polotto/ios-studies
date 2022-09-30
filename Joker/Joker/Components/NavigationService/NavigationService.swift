//
//  NavigationService.swift
//  Joker
//
//  Created by Angelo Polotto on 28/09/22.
//

import Foundation
import UIKit

class NavigationService: NavigationServiceProtocol {
    private let pageMap = [
        String(describing: HomeViewModel.self): HomeViewController.self,
        String(describing: MoreJokesViewModel.self): MoreJokesViewController.self
    ]
    
    func pushToRoot<T>(_ viewModelType: T.Type, parameters: Any? = nil) {
        let key = String(describing: viewModelType)
        let pageType = pageMap[key]!
        
        let newViewController = pageType.init()
        newViewController.parameters = parameters
        
        if let viewController = UIApplication.shared.windows.first!.rootViewController as? BaseViewController {
            viewController.parameters = parameters
            viewController.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func pushToRoot<T>(_ viewModelType: T.Type) {
        pushToRoot(viewModelType, parameters: nil)
    }
    
    func push<T>(_ viewModelType: T.Type, parameters: Any? = nil) {
        let key = String(describing: viewModelType)
        let pageType = pageMap[key]!
        
        let newViewController = pageType.init()
        newViewController.parameters = parameters
        
        if let topViewController = UIApplication.getTopViewController() {
            topViewController.navigationController?.pushViewController(newViewController, animated: true)
        }
    }
    
    func present<T>(_ viewModelType: T.Type, parameters: Any? = nil) {
        let key = String(describing: viewModelType)
        let pageType = pageMap[key]!
        
        let newViewController = pageType.init()
        newViewController.parameters = parameters
        
        if let topViewController = UIApplication.getTopViewController() {
            topViewController.present(newViewController, animated: true, completion: nil)
        }
    }
    
    func push<T>(_ viewModelType: T.Type) {
        push(viewModelType, parameters: nil)
    }
    
    func present<T>(_ viewModelType: T.Type) {
        present(viewModelType, parameters: nil)
    }
}

extension UIApplication {
    class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {

        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)

        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)

        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}
