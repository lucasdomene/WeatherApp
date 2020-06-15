//
//  HomeViewController.swift
//  Weather
//
//  Created by lucas.firmo on 6/15/20.
//  Copyright © 2020 domene. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session = URLSession.shared
        let parameterEncoder = ParameterEncoder(
            bodyEncoder: BodyEncoder(),
            urlEncoder: URLEncoder()
        )
        
        let networkManager = NetworkManager(
            session: session,
            parameterEncoder: parameterEncoder
        )
        
        let route = WeatherAPI.currentWeather(cityName: "london")
        networkManager.request(route: route) { result in
            switch result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
