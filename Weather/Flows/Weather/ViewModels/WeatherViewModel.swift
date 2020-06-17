//
//  WeatherViewModel.swift
//  Weather
//
//  Created by lucas.firmo on 6/16/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

class WeatherViewModel {
    
    // MARK: - Properties
    
    weak var view: WeatherViewController?
    private let weatherService: WeatherService
   
    // MARK: - Init
    
    init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }
    
    // MARK: - Fetch
    
    func fetchWeather(for lat: Double, lon: Double) {
        weatherService.weather(for: lat, lon: lon) { [weak self] result in
            switch result {
            case .success(let weather):
                DispatchQueue.main.async {
                    let viewData = WeatherViewData(weatherResponse: weather)
                    self?.view?.update(weather: viewData)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
