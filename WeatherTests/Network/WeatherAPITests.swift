//
//  WeatherAPITests.swift
//  WeatherTests
//
//  Created by lucas.firmo on 6/17/20.
//  Copyright © 2020 domene. All rights reserved.
//

import XCTest
@testable import Weather

class WeatherAPITests: XCTestCase {
    
    func testWeatherRoute() {
        let route = WeatherAPI.weather(lat: 100, lon: 100)
        let urlParameters = route.urlParameters as! [String: Double]
        let expectedURLParameters = ["lat": 100.0, "lon": 100.0]
        
        XCTAssertEqual(route.path, "onecall")
        XCTAssertEqual(route.httpMethod, .get)
        XCTAssert(route.bodyParameters.isEmpty)
        XCTAssertEqual(urlParameters, expectedURLParameters)
        XCTAssertEqual(route.baseURL,
                       URL(string: NetworkConstants.baseURL))
    }
    
}
