//
//  WeatherViewModelTests.swift
//  WeatherTests
//
//  Created by lucas.firmo on 6/17/20.
//  Copyright © 2020 domene. All rights reserved.
//

import XCTest
@testable import Weather

class WeatherViewModelTests: XCTestCase {
    
    func testRandomCity() {
        let service = WeatherServiceMock()
        let viewModel = WeatherViewModel(weatherService: service)
        
        let city = viewModel.randomCity()
        
        XCTAssertNotNil(city)
    }
    
    func testFetchWeather() {
        let service = WeatherServiceMock()
        let viewModel = WeatherViewModel(weatherService: service)
        let view = WeatherViewMock(viewModel: viewModel)
        viewModel.view = view
        
        viewModel.fetchWeather(for: 0, lon: 0)
        
        XCTAssert(view.didSetViewData)
    }
    
}
