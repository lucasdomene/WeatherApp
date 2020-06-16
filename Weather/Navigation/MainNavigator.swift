//
//  MainNavigator.swift
//  Weather
//
//  Created by lucas.firmo on 6/16/20.
//  Copyright © 2020 domene. All rights reserved.
//

import UIKit

class MainNavigator: Navigator {
    
    enum Destination {
        case weather
    }
    
    private let navigationController: UINavigationController
    private let networkManager: NetworkManager
    
    init(navigationController: UINavigationController,
         networkManager: NetworkManager) {
        self.navigationController = navigationController
        self.networkManager = networkManager
    }
    
    func navigate(to destination: MainNavigator.Destination) {
        let viewController = makeViewController(for: destination)
        navigationController.setViewControllers(
            [viewController],
            animated: false
        )
        navigationController.setNavigationBarHidden(true,
                                                    animated: false)
    }
    
    func makeViewController(for destination: Destination) -> UIViewController {
        switch destination {
        case .weather:
            let service = WeatherService(networkManager: networkManager)
            let weatherViewModel = WeatherViewModel(weatherService: service)
            let weatherViewController = WeatherViewController(viewModel: weatherViewModel)
            weatherViewModel.view = weatherViewController
            return weatherViewController
        }
    }
    
}
