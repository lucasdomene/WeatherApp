//
//  ForecastViewTests.swift
//  WeatherTests
//
//  Created by lucas.firmo on 6/16/20.
//  Copyright © 2020 domene. All rights reserved.
//

import XCTest
import SnapshotTesting

@testable import Weather

class ForecastViewTests: XCTestCase {

    func testForecastView() {
        let size = CGSize(width: 100, height: 100)
        let frame = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        let forecastView = ForecastView(frame: frame)
        
        forecastView.weekdayLabel.text = "Fri"
        forecastView.iconImageView.image = R.image.weatherCondition()
        forecastView.maxTemperatureLabel.text = "23°"
        forecastView.minTemperatureLabel.text = "16°"
        
        assertSnapshot(matching: forecastView,
                       as: .image,
                       record: false)
    }

}
