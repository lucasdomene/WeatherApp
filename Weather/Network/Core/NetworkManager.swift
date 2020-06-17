//
//  NetworkManager.swift
//  Weather
//
//  Created by lucas.firmo on 6/15/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

typealias NetworkResponse = (Result<Data, Error>) -> Void

final class NetworkManager {
    
    // MARK: - Properties
    
    private let session: URLSessionType
    private let parameterEncoder: ParameterEncoderType
    private var task: URLSessionTask?
    
    // MARK: - Init
    
    init(session: URLSessionType,
         parameterEncoder: ParameterEncoderType) {
        self.session = session
        self.parameterEncoder = parameterEncoder
    }
    
    // MARK: - Fetch
    
    func request(route: Route, completion: @escaping NetworkResponse) {
        guard let urlRequest = route.asURLRequest(
            parameterEncoder: parameterEncoder
        ) else { return }
        
        task = session.dataTask(with: urlRequest) {
            data, _, error in
            if let error = error {
                let code = (error as NSError).code
                completion(.failure(WeatherError(code: code)))
            }
            
            guard let data = data else {
                completion(.failure(WeatherError.fetching))
                return
            }
            
            completion(.success(data))
        }
        
        task?.resume()
    }
    
    func cancel() {
        task?.cancel()
    }
}
