//
//  WeatherError.swift
//  Weather
//
//  Created by lucas.firmo on 6/15/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

enum WeatherError: Error {
    case noConnection
    case fetching
    
    init(code: Int) {
        switch code {
        case NSURLErrorNotConnectedToInternet:
            self = .noConnection
        default:
            self = .fetching
        }
    }
}
