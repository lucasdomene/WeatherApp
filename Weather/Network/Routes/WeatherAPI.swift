//
//  WeatherAPI.swift
//  Weather
//
//  Created by lucas.firmo on 6/15/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

enum WeatherAPI: Route {
    
    case currentWeather(cityName: String)
    
    var path: String {
        switch self {
        case .currentWeather:
            return "weather"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .currentWeather:
            return .get
        }
    }
    
    var bodyParameters: Parameters {
        switch self {
        case .currentWeather:
            return [:]
        }
    }
    
    var urlParameters: Parameters {
        switch self {
        case .currentWeather(let cityName):
            return ["q": cityName]
        }
    }
    
}
