//
//  NetworkServiceProtocol.swift
//  Joker
//
//  Created by Angelo Polotto on 27/09/22.
//

import Foundation

protocol NetworkServiceProtocol {
    func httpGet<T: Codable>(with responseObjectType: T.Type,
                             url: String, headers: [String: String],
                             completion: @escaping (Result<T>) -> Void)
    
    func httpPost<T: Codable, R: Codable>(with responseObjectType: T.Type,
                                         url: String, headers: [String: String],
                                         body: R,
                                         completion: @escaping (Result<T>) -> Void)
}
