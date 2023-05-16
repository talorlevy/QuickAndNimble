//
//  QuickAndNimbleTests.swift
//  QuickAndNimbleTests
//
//  Created by Talor Levy on 5/15/23.
//

// MARK: - 01 >> Import Quick and Nimble frameworks

import Quick
import Nimble


// MARK: - 02 >> Testable import of module to be tested

@testable import QuickAndNimble


// MARK: - 03 >>

// class name: What feature you are testing (testing + Specs)
// In Quick, testing suites are called "Specs"
// Inherit your test class with "XCTestCase" when using XCTestCase
// Inherit your test class with "QuickSpec" when using Quick and Nimble


class WeatherForecastSpecs: QuickSpec {
    
    // MARK: - 04 >>

    // Every test suite has a main method - spec()
    // that contains all the test cases
    
    override func spec() {
        // sut => system under test
        
        var sut = WeatherResponseModel!
        
        let expectedForecaseObjectCounts = 40
        let apiTimeoutInSeconds = 120.0
        let successResponseCode = 200
        
        describe("The weather forecase API response") {
            var mockLocation: LocationMock!
            
            context("When location is given") {
                
                beforeEach {
                    mockLocation = MocksBuilder.createLocationMock(city: .banglore)
                }
                
                it("Network response should provide 40 objects for current day forecase") {
                    waitUntil(timeout: apiTimeoutInSeconds) { done in
                        NetworkManager.shared.fetchWeatherFor(lat: mockLocation.latitude) {
                            
                        }
                    }
                }
                
            }
        }
    }
    
}






//final class QuickAndNimbleTests: XCTestCase {
//
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
//
//}
