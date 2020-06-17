//
//  WeatherResponse.swift
//  Weather
//
//  Created by lucas.firmo on 6/15/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

struct WeatherResponse {
    let timezoneOffset: Int
    let current: Weather
    let forecast: [Forecast]
}

extension WeatherResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case timezoneOffset = "timezone_offset"
        case current
        case forecast = "daily"
    }
}
