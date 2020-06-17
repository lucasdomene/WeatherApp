//
//  WeatherInfo.swift
//  Weather
//
//  Created by lucas.firmo on 6/15/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

struct WeatherInfo {
    let description: String
    let iconPath: String
    let code: Int
    
    var icon: URL? {
        var imageURLString = NetworkConstants.imageURL
        imageURLString.append(iconPath)
        imageURLString.append(NetworkConstants.imageSuffix)
        return URL(string: imageURLString)
    }
}

extension WeatherInfo: Codable {
    enum CodingKeys: String, CodingKey {
        case description = "main"
        case iconPath = "icon"
        case code = "id"
    }
}
