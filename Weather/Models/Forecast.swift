//
//  Forecast.swift
//  Weather
//
//  Created by lucas.firmo on 6/15/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

struct Forecast {
    let temperature: Temperature
    let info: [WeatherInfo]
    let timestamp: Double
}

extension Forecast: Codable {
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case info = "weather"
        case timestamp = "dt"
    }
}
