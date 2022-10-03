//
//  HomeViewModelTests.swift
//  JokerTests
//
//  Created by Angelo Polotto on 03/10/22.
//

import XCTest
@testable import Joker

class HomeViewModelTests: XCTestCase {
    var apiService: ApiServiceMock!
    var navigationService: NavigationServiceMock!
    var messageService: MessageServiceMock!
    
    var viewModel: HomeViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        apiService = ApiServiceMock()
        navigationService = NavigationServiceMock()
        messageService = MessageServiceMock()
        
        viewModel = HomeViewModel(apiService: apiService,
                                      navigationService: navigationService,
                                      messageService: messageService)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        
        try super.tearDownWithError()
    }

    func testReceiveNewJoke() throws {
        try apiService.setupLoadRandomJoke()
        
        viewModel.joke = { (joke, category) in
            XCTAssertNotNil(joke)
            XCTAssertNotNil(category)
        }
        
        viewModel.receiveNewJoke()
    }
    
    func testReceiveNewJokeFail() throws {
        let requestError = apiService.setupFailLoadRandomJoke()
        
        viewModel.joke = { (joke, category) in
            XCTAssertEqual(joke, String())
            XCTAssertEqual(category, String())
        }
        
        messageService.errorInvoked = { message in
            XCTAssertEqual(message, requestError.description)
        }
        
        viewModel.receiveNewJoke()
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
}
