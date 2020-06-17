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
    
    // Default Session
    lazy var session = URLSession.shared
    
    // Default Encoder
    lazy var parameterEncoder = ParameterEncoder(
        bodyEncoder: BodyEncoder(),
        urlEncoder: URLEncoder()
    )
    
    // Network Instance
    lazy var networkManager = NetworkManager(session: session, parameterEncoder: parameterEncoder)

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        
        let mainNavigator = MainNavigator(
            navigationController: navigationController,
            networkManager: networkManager
        )
        mainNavigator.navigate(to: .weather)
        
        window?.makeKeyAndVisible()
    }

}
