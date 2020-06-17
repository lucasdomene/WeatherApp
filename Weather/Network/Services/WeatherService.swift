//
//  WeatherService.swift
//  Weather
//
//  Created by lucas.firmo on 6/15/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

typealias WeatherResult = (Result<WeatherResponse, Error>) -> Void

struct WeatherService {
    
    // MARK: - Properties
    
    private let networkManager: NetworkManager
    
    // MARK: - Init
    
    init(networkManager: NetworkManager) {
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
    
    private func handle<T: Decodable>(_ result: Result<Data, Error>, completion: @escaping (Result<T, Error>) -> Void) {
        switch result {
        case .success(let data):
            do {
                let weatherResponse = try JSONDecoder().decode(T.self, from: data)
                
                completion(.success(weatherResponse))
            } catch {
                completion(.failure(WeatherError.fetching))
            }
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
}
