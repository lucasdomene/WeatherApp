//
//  WeatherColor.swift
//  Weather
//
//  Created by lucas.firmo on 6/16/20.
//  Copyright © 2020 domene. All rights reserved.
//

import UIKit

enum WeatherColor {
    
    case clear
    case cloud
    case snow
    case fog
    case rain
    case thunderstorm
    case drizzle
    
    init(code: Int) {
        switch code {
        case 200...232:
            self = .thunderstorm
        case 300...321:
            self = .drizzle
        case 500...531:
            self = .rain
        case 600...632:
            self = .snow
        case 700...781:
            self = .fog
        case 200...232:
            self = .thunderstorm
        case 800:
            self = .clear
        case 801...804:
            self = .cloud
        default:
            self = .clear
        }
    }
    
    private var colorPath: (day: String, night: String) {
        switch self {
        case .clear:
            return ("A", "B")
        case .cloud:
            return ("A", "B")
        case .snow:
            return ("C", "D")
        case .fog:
            return ("E", "F")
        case .rain:
            return ("G", "H")
        case .thunderstorm:
            return ("I", "J")
        case .drizzle:
            return ("K", "L")
        }
    }
    
    var colors: WeatherConditionColor {
        let firstDayColor = UIColor(named: "Color\(colorPath.day)1")!
        let secondDayColor = UIColor(named: "Color\(colorPath.day)2")!
        let firstNightColor = UIColor(named: "Color\(colorPath.night)1")!
        let secondNightColor = UIColor(named: "Color\(colorPath.night)2")!
        
        let dayGradientColor = GradientColor(
            startColor: firstDayColor.cgColor,
            endColor: secondDayColor.cgColor
        )
        
        let nightGradientColor = GradientColor(
            startColor: firstNightColor.cgColor,
            endColor: secondNightColor.cgColor
        )
        
        return WeatherConditionColor(
            dayColor: dayGradientColor,
            nightColor: nightGradientColor
        )
    }
    
}
