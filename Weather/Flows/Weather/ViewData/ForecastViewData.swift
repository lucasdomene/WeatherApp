//
//  ForecastViewData.swift
//  Weather
//
//  Created by lucas.firmo on 6/17/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

struct ForecastViewData {
    
    // MARK: - Properties
    
    private let forecast: Forecast
    
    // MARK: - Init
    
    init(forecast: Forecast) {
        self.forecast = forecast
    }
    
    // MARK: - Computed Properties
    
    var minTemperature: String {
        let temperature = Int(forecast.temperature.min)
        return "\(temperature)°"
    }
    
    var maxTemperature: String {
        let temperature = Int(forecast.temperature.max)
        return "\(temperature)°"
    }
    
    var condition: String {
        guard let condition = forecast.info.first else {
            return WeatherConstants.defaultCondition
        }
        return condition.description
    }
    
    var iconURL: URL? {
        return forecast.info.first?.icon
    }
    
    var code: Int {
        guard let code = forecast.info.first?.code else {
            return WeatherConstants.defaultCode
        }
        return code
    }
    
    var weekday: String {
        let date = Date(timeIntervalSince1970: forecast.timestamp)
        return date.weekday
    }
    
}
