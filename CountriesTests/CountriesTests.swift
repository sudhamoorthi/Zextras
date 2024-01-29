//
//  CountriesTests.swift
//  CountriesTests
//
//  Created by Sudha on 27/01/24.
//

import XCTest
@testable import Countries

final class CountriesTests: XCTestCase {
    
    func testFetchData() {
        let networkService = RestCountriesNetworkService()
        let dataStorageService = UserDefaultsDataStorageService()
        let viewModel = CountryListViewModel(networkService: networkService, dataStorageService: dataStorageService)
        
        let expectation = XCTestExpectation(description: "Fetch Data")
        
        viewModel.fetchData {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
        
        let countries = viewModel.getCountries()
        XCTAssertFalse(countries.isEmpty, "Countries should not be empty after fetching data")
    }
    

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

}


