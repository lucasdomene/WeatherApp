//
//  WeatherViewDataTests.swift
//  WeatherTests
//
//  Created by lucas.firmo on 6/18/20.
//  Copyright © 2020 domene. All rights reserved.
//

import XCTest

@testable import Weather

class WeatherViewDataTests: XCTestCase {
    
    var viewData: WeatherViewData!
    
    override func setUp() {
        super.setUp()
        
        let weatherResponse = WeatherServiceMock().weatherResponse
        viewData = WeatherViewData(weatherResponse: weatherResponse)
    }
    
    override func tearDown() {
        super.tearDown()
        viewData = nil
    }
    
    func testTemperature() {
        XCTAssertEqual(viewData.temperature, "24°")
        XCTAssertEqual(viewData.condition, "Clouds")
        XCTAssertEqual(viewData.code, 803)
        XCTAssert(!viewData.isDay)
        XCTAssertEqual(viewData.time, "Wed, 10:35 pm")
        XCTAssert(!viewData.forecast.isEmpty)
        XCTAssertEqual(viewData.iconURL?.absoluteString, "https://openweathermap.org/img/wn/04n@2x.png")
    }
    
}
