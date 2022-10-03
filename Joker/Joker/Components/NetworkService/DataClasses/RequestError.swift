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
    case unknown
    
    public var description: String {
        switch self {
        case .urlError:
            return "Invalid URL"
        case .networkError(_):
            return "Network error"
        case .dataNotFound:
            return "Data not found"
        case .jsonParsingError(_):
            return "Data parsing error"
        case .invalidStatusCode(_):
            return "Invalid status code"
        case .unknown:
            return "Unkwown"
        }
    }
}
