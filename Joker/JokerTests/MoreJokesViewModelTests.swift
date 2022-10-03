//
//  MoreJokesViewModelTests.swift
//  JokerTests
//
//  Created by Angelo Polotto on 03/10/22.
//

import XCTest
@testable import Joker

class MoreJokesViewModelTests: XCTestCase {
    var lastJoke: Joke!
    var apiService: ApiServiceMock!
    var messageService: MessageServiceMock!
    
    var viewModel: MoreJokesViewModel!
    
    // handle wanted exceptions
    // ui tests
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        lastJoke = Joke()
        apiService = ApiServiceMock()
        messageService = MessageServiceMock()
        
        viewModel = MoreJokesViewModel(lastJoke: lastJoke, apiService: apiService, messageService: messageService)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        
        try super.tearDownWithError()
    }

    func testReloadData() throws {
        try apiService.setupLoad10RandomJokes()
        
        viewModel.reloadData = {
            XCTAssertNotNil(self.viewModel.jokes)
        }
        
        viewModel.laterInit()
    }
    
    func testReloadDataFail() throws {
        let requestError = apiService.setupFailLoad10RandomJokes()
        
        viewModel.reloadData = {
            // the VM can't call this, the message need to be called instead
            XCTFail()
        }
        messageService.errorInvoked = { message in
            XCTAssertEqual(message, requestError.description)
        }
        
        viewModel.laterInit()
    }
    
    func testTitle() throws {
        try apiService.setupLoad10RandomJokes()
        
        viewModel.title = { title in
            XCTAssertEqual(title, self.lastJoke.category)
        }
        
        viewModel.laterInit()
    }
}
