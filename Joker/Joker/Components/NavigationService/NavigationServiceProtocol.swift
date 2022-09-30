//
//  NavigationServiceProtocol.swift
//  Joker
//
//  Created by Angelo Polotto on 28/09/22.
//

import Foundation

protocol NavigationServiceProtocol {
    func pushToRoot<T>(_ viewModelType: T.Type, parameters: Any?)
    func pushToRoot<T>(_ viewModelType: T.Type)
    func push<T>(_ viewModelType: T.Type, parameters: Any?)
    func present<T>(_ viewModelType: T.Type, parameters: Any?)
    func push<T>(_ viewModelType: T.Type)
    func present<T>(_ viewModelType: T.Type)
}
