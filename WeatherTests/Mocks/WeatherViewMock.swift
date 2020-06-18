//
//  WeatherViewMock.swift
//  WeatherTests
//
//  Created by lucas.firmo on 6/18/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation
@testable import Weather

class WeatherViewMock: WeatherViewType {
        
    let viewModel: WeatherViewModelType
    var didSetViewData = false
    
    init(viewModel: WeatherViewModelType) {
        self.viewModel = viewModel
    }
    
    func update(weather: WeatherViewData) {
        didSetViewData = true
    }
    
    func show(error: WeatherError) {}
}
