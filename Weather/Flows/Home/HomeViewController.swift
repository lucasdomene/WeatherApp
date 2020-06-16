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
        
        let service = WeatherService(networkManager: networkManager)
        service.weather(for: 33.441792, lon: 94.037689) { result in
            switch result {
            case .success(let weather):
                print(weather)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
