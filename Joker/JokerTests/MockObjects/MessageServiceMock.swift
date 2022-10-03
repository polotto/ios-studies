//
//  MessageServiceMock.swift
//  JokerTests
//
//  Created by Angelo Polotto on 03/10/22.
//

import Foundation
@testable import Joker

class MessageServiceMock: MessageServiceProtocol {
    var errorInvoked: ((String) -> Void)!
    
    func error(_ message: String, dismissed: @escaping () -> Void) {
        errorInvoked(message)
        dismissed()
    }
    
    func error(_ message: String) async {
        errorInvoked(message)
    }
}
