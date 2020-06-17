//
//  WeatherViewModel.swift
//  Weather
//
//  Created by lucas.firmo on 6/16/20.
//  Copyright © 2020 domene. All rights reserved.
//

// swiftlint:disable force_try

import Foundation

class WeatherViewModel {
    
    // MARK: - Properties
    
    weak var view: WeatherViewController?
    private let weatherService: WeatherService
    private var cities: [City]
    private var isFetching = false
   
    // MARK: - Init
    
    init(weatherService: WeatherService) {
        self.weatherService = weatherService
        let path = R.file.citiesPlist()!
        let data = try! Data(contentsOf: path)
        cities = try! PropertyListDecoder().decode([City].self, from: data)
    }
    
    func randomCity() -> City {
        return cities.randomElement()!
    }
    
    // MARK: - Fetch
    
    func fetchWeather(for lat: Double, lon: Double) {
        if isFetching { return }
        isFetching = true
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
            self?.isFetching = false
        }
    }
    
}
