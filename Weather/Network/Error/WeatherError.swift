//
//  WeatherError.swift
//  Weather
//
//  Created by lucas.firmo on 6/15/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

enum WeatherError: String, Error {
    case noConnection = "Ops! Check your internet connection."
    case parsing = "Ops! Something went wrong. Try again."
    
    init(code: Int) {
        switch code {
        case NSURLErrorNotConnectedToInternet:
            self = .noConnection
        default:
            self = .parsing
        }
    }
}
