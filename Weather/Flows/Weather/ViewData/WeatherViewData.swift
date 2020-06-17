//
//  WeatherViewData.swift
//  Weather
//
//  Created by lucas.firmo on 6/16/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

struct WeatherViewData {
    
    // MARK: - Properties
    
    private let weatherResponse: WeatherResponse
    
    // MARK: - Init
    
    init(weatherResponse: WeatherResponse) {
        self.weatherResponse = weatherResponse
    }
    
    // MARK: - Computed Properties
    
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
