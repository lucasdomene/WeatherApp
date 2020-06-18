//
//  NetworkManagerMock.swift
//  WeatherTests
//
//  Created by lucas.firmo on 6/17/20.
//  Copyright © 2020 domene. All rights reserved.
//

// swiftlint:disable force_try

import Foundation
@testable import Weather

class NetworkManagerMock: NetworkManagerType {
    
    enum Response {
        case success
        case parseFailure
        case networkFailure
    }
    
    private let response: Response
    
    init(response: Response) {
        self.response = response
    }
    
    func request(route: Route, completion: @escaping NetworkResponse) {
        switch response {
        case .success:
            let data = try! Data(contentsOf: R.file.weatherResponseJson()!)
            completion(.success(data))
        case .parseFailure:
            completion(.success(Data()))
        case .networkFailure:
            completion(.failure(WeatherError.noConnection))
        }
    }
    
}
