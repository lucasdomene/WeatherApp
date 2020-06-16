//
//  WeatherAPI.swift
//  Weather
//
//  Created by lucas.firmo on 6/15/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

enum WeatherAPI: Route {

    case weather(lat: Double, lon: Double)
    
    var path: String {
        switch self {
        case .weather:
            return "onecall"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .weather:
            return .get
        }
    }
    
    var bodyParameters: Parameters {
        switch self {
        case .weather:
            return [:]
        }
    }
    
    var urlParameters: Parameters {
        switch self {
        case .weather(let lat, let lon):
            return ["lat": lat, "lon": lon]
        }
    }
    
}
