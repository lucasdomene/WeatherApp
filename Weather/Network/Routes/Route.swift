//
//  Route.swift
//  Weather
//
//  Created by lucas.firmo on 6/15/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

typealias HTTPHeader = [String: String]
typealias Parameters = [String: Any]

protocol Route {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var bodyParameters: Parameters { get }
    var urlParameters: Parameters { get }
    
    func asURLRequest(parameterEncoder: ParameterEncoderType) -> URLRequest?
}

extension Route {
    var baseURL: URL {
        return URL(string: "https://api.openweathermap.org/data/2.5/")!
    }
    
    func asURLRequest(parameterEncoder: ParameterEncoderType) -> URLRequest? {
        var url = baseURL
        url.appendPathComponent(path)
        let urlRequest = URLRequest(url: url)

        return parameterEncoder.encode(
            urlRequest: urlRequest,
            bodyParameters: bodyParameters,
            urlParameters: urlParameters
        )
    }
    
}
