//
//  WeatherViewData.swift
//  Weather
//
//  Created by lucas.firmo on 6/16/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

struct WeatherViewData {
    
    private let weatherResponse: WeatherResponse
    
    init(weatherResponse: WeatherResponse) {
        self.weatherResponse = weatherResponse
    }
    
    var temperature: String {
        let temperature = Int(weatherResponse.current.temperature)
        return "\(temperature)°"
    }
    
    var condition: String {
        guard let condition = weatherResponse.current.info.first else {
            return "Clear"
        }
        return condition.description
    }
    
    var iconURL: URL? {
        return weatherResponse.current.info.first?.icon
    }
    
    var code: Int {
        guard let code = weatherResponse.current.info.first?.code else {
            return 800
        }
        return code
    }
    
}
