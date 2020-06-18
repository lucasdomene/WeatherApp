//
//  WeatherConditionViewTests.swift
//  WeatherTests
//
//  Created by lucas.firmo on 6/15/20.
//  Copyright © 2020 domene. All rights reserved.
//

import XCTest
import SnapshotTesting

@testable import Weather

class WeatherConditionViewTests: XCTestCase {

    func testWeatherConditionView() {
        let size = CGSize(width: 200, height: 60)
        let frame = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        let weatherConditionView = WeatherConditionView(frame: frame)
        
        weatherConditionView.conditionLabel.text = "Clear"
        weatherConditionView.iconImageView.image = R.image.weatherCondition()
        assertSnapshot(matching: weatherConditionView,
                       as: .image,
                       record: false)
    }

}
