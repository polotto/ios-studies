//
//  RequestError.swift
//  Joker
//
//  Created by Angelo Polotto on 27/09/22.
//

import Foundation

enum RequestError: Error {
    case urlError
    case networkError(Error)
    case dataNotFound
    case jsonParsingError(Error)
    case invalidStatusCode(Int)
}
