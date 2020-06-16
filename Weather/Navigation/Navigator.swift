//
//  Navigator.swift
//  Weather
//
//  Created by lucas.firmo on 6/16/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

protocol Navigator {
    associatedtype Destination
    func navigate(to destination: Destination)
}
