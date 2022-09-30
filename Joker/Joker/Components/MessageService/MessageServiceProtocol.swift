//
//  MessageServiceProtocol.swift
//  Joker
//
//  Created by Angelo Polotto on 29/09/22.
//

import Foundation

protocol MessageServiceProtocol {
    func error(_ message: String, dismissed: @escaping () -> Void)
    func error(_ message: String) async
}
