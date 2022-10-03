//
//  JokerIntegrationTests.swift
//  JokerIntegrationTests
//
//  Created by Angelo Polotto on 03/10/22.
//

import XCTest
@testable import Joker

class JokerApiServiceTests: XCTestCase {
    var apiService: ApiService!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        apiService = ApiService(networkService: NetworkService())
    }

    override func tearDownWithError() throws {
        apiService = nil
        
        try super.tearDownWithError()
    }

    func testLoadRandomJoke() throws {
        let promise = expectation(description: "joke received")

        apiService.loadRandomJoke { result in
            switch result {
            case .success(let jokes):
                print(jokes)
                promise.fulfill()
            case .failure(let error):
                XCTFail("error to get the data: \(error)")
            }
        }

        wait(for: [promise], timeout: 5)
    }
    
    func testLoad10RandomJokes() async throws {
        let jokes = try await apiService.load10RandomJokes()
        XCTAssertEqual(jokes.jokes.count, 10)
    }
}
