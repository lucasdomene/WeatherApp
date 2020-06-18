//
//  WeatherService.swift
//  Weather
//
//  Created by lucas.firmo on 6/15/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

typealias WeatherResult = (Result<WeatherResponse, WeatherError>) -> Void

protocol WeatherServiceType {
    func weather(for lat: Double,
                 lon: Double,
                 completion: @escaping WeatherResult)
}

struct WeatherService: WeatherServiceType {
    
    // MARK: - Properties
    
    private let networkManager: NetworkManagerType
    
    // MARK: - Init
    
    init(networkManager: NetworkManagerType) {
        self.networkManager = networkManager
    }
       
    // MARK: - Fetch
    
    func weather(for lat: Double,
                 lon: Double,
                 completion: @escaping WeatherResult) {
        let route = WeatherAPI.weather(lat: lat, lon: lon)
        
        networkManager.request(route: route) { result in
            self.handle(result, completion: completion)
        }
    }
    
    // MARK: - Parse
    
    private func handle<T: Decodable>(_ result: Result<Data, WeatherError>, completion: @escaping (Result<T, WeatherError>) -> Void) {
        switch result {
        case .success(let data):
            do {
                let weatherResponse = try JSONDecoder().decode(T.self, from: data)
                
                completion(.success(weatherResponse))
            } catch {
                completion(.failure(WeatherError.parsing))
            }
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
}
