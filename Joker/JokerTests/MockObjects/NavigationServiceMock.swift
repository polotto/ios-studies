//
//  NavigationServiceMock.swift
//  JokerTests
//
//  Created by Angelo Polotto on 03/10/22.
//

import Foundation
@testable import Joker

class NavigationServiceMock: NavigationServiceProtocol {
    func pushToRoot<T>(_ viewModelType: T.Type, parameters: Any?) {
    }
    
    func pushToRoot<T>(_ viewModelType: T.Type) {
    }
    
    func push<T>(_ viewModelType: T.Type, parameters: Any?) {
    }
    
    func present<T>(_ viewModelType: T.Type, parameters: Any?) {
    }
    
    func push<T>(_ viewModelType: T.Type) {
    }
    
    func present<T>(_ viewModelType: T.Type) {
    }
    
    
}
