//
//  Weather.swift
//  Weather
//
//  Created by lucas.firmo on 6/15/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

struct Weather {
    let temperature: Double
    let info: [WeatherInfo]
    let currentTimestamp: Double
    let sunriseTimestamp: Double
    let sunsetTimestamp: Double
}

extension Weather: Codable {
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case info = "weather"
        case currentTimestamp = "dt"
        case sunriseTimestamp = "sunrise"
        case sunsetTimestamp = "sunset"
    }
}
