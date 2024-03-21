//
//  TinybeansTests.swift
//  TinybeansTests
//
//  Created by Ahmad Safdar on 3/20/24.
//

import XCTest
@testable import Tinybeans

final class TinybeansTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testPassFetchMovieData() {
        // Given
        let viewModel = MoviesViewModel(moviesFetcher: MovieService())
        let expectation = expectation(description: "Data fetched and decoded successfully")
        
        // When
        viewModel.fetchMovies()
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            switch viewModel.moviesState {
            case .loading:
                XCTFail("Failed to fetch data")
            case .idle:
                XCTFail("Failed to fetch data")
            case .failed(let error):
                XCTFail("Failed to fetch data")
            case .loaded(let myIP):
                XCTAssertNotNil(myIP, "Data should not be nil")
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 5)
    }
    
    func testFetchDataWithMockIP() {
        // Given
        let viewModel = MockMoviesViewModel(moviesFetcher: MockMovieService())
        let expectation = expectation(description: "Data fetched and decoded successfully")

        // When
        viewModel.fetchMovies()

        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            switch viewModel.moviesState {
            case .loading:
                XCTFail("Failed to fetch data")
            case .idle:
                XCTFail("Failed to fetch data")
            case .failed(let error):
                XCTFail("Failed to fetch data")
            case .loaded(let result):
                XCTAssertNotNil(result, "Data should not be nil")
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 3)
    }

}
