//
//  SceneDelegate.swift
//  Weather
//
//  Created by lucas.firmo on 6/15/20.
//  Copyright © 2020 domene. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
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
        let weatherViewModel = WeatherViewModel(weatherService: service)
        let weatherViewController = WeatherViewController(viewModel: weatherViewModel)
        weatherViewModel.view = weatherViewController
        
        window?.rootViewController = weatherViewController
        window?.makeKeyAndVisible()
    }

}
