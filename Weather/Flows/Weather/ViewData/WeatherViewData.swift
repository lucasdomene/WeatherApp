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
    
    var isDay: Bool {
        let nowTimestamp = weatherResponse.current.currentTimestamp
        let sunriseTimestamp = weatherResponse.current.sunsetTimestamp
        let sunsetTimestamp = weatherResponse.current.sunriseTimestamp
        
        let now = Date(timeIntervalSince1970: nowTimestamp)
        let sunrise = Date(timeIntervalSince1970: sunriseTimestamp)
        let sunset = Date(timeIntervalSince1970: sunsetTimestamp)
        
        return now > sunrise && now < sunset
    }
    
    var forecast: [ForecastViewData] {
        return weatherResponse.forecast.map {
            ForecastViewData(forecast: $0)
        }
    }
    
}

struct ForecastViewData {
    
    private let forecast: Forecast
    
    init(forecast: Forecast) {
        self.forecast = forecast
    }
    
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
            return "Clear"
        }
        return condition.description
    }
    
    var iconURL: URL? {
        return forecast.info.first?.icon
    }
    
    var code: Int {
        guard let code = forecast.info.first?.code else {
            return 800
        }
        return code
    }
    
    var weekday: String {
        let date = Date(timeIntervalSince1970: forecast.timestamp)
        return date.weekday
    }
    
}
