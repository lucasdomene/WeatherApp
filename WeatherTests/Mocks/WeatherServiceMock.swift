//
//  WeatherServiceMock.swift
//  WeatherTests
//
//  Created by lucas.firmo on 6/17/20.
//  Copyright © 2020 domene. All rights reserved.
//

// swiftlint:disable force_try

import Foundation
@testable import Weather

struct WeatherServiceMock: WeatherServiceType {
    
    var weatherResponse: WeatherResponse {
        let path = R.file.weatherResponseJson()!
        let data = try! Data(contentsOf: path)
        let weatherResponse = try! JSONDecoder().decode(
            WeatherResponse.self,
            from: data
        )
        return weatherResponse
    }
    
    func weather(for lat: Double,
                 lon: Double,
                 completion: @escaping WeatherResult) {
        completion(.success(weatherResponse))
    }
    
}
