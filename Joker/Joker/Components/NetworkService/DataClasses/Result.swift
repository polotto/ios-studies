//
//  Result.swift
//  Joker
//
//  Created by Angelo Polotto on 27/09/22.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(RequestError)
}
