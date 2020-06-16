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
}

extension Weather: Codable {
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case info = "weather"
    }
}
