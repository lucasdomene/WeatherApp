//
//  WeatherViewModel.swift
//  Weather
//
//  Created by lucas.firmo on 6/16/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

class WeatherViewModel {
    
    weak var view: WeatherViewController?
    private let weatherService: WeatherService
    private var weather: WeatherResponse? {
        didSet {
            let weatherViewData = WeatherViewData(
                weatherResponse: self.weather!
            )
            view?.updateWeather(weatherViewData)
        }
    }
    
    init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }
    
    func fetchWeather(for lat: Double, lon: Double) {
        weatherService.weather(for: lat, lon: lon) { result in
            switch result {
            case .success(let weather):
                DispatchQueue.main.async {
                    self.weather = weather
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
