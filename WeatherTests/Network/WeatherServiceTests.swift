//
//  WeatherServiceTests.swift
//  WeatherTests
//
//  Created by lucas.firmo on 6/17/20.
//  Copyright © 2020 domene. All rights reserved.
//

import XCTest
@testable import Weather

class WeatherServiceTests: XCTestCase {
    
    var service: WeatherService!
    var networkManager: NetworkManagerType!
    
    func testSuccess() {
        networkManager = NetworkManagerMock(response: .success)
        service = WeatherService(networkManager: networkManager)
        service.weather(for: 100, lon: 100) { result in
            switch result {
            case .success:
                XCTAssert(true)
            case .failure:
                XCTFail("Should not fail")
            }
        }
    }
    
    func testParsingError() {
        networkManager = NetworkManagerMock(response: .parseFailure)
        service = WeatherService(networkManager: networkManager)
        service.weather(for: 0, lon: 0) { result in
            switch result {
            case .success:
                XCTFail("Should not be successful")
            case .failure(let error):
                XCTAssertEqual(error, WeatherError.parsing)
            }
        }
    }
    
    func testNetworkError() {
        networkManager = NetworkManagerMock(response: .networkFailure)
        service = WeatherService(networkManager: networkManager)
        service.weather(for: 0, lon: 0) { result in
            switch result {
            case .success:
                XCTFail("Should not be successful")
            case .failure(let error):
                XCTAssertEqual(error, WeatherError.noConnection)
            }
        }
    }
    
}
