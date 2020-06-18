//
//  Fadable.swift
//  Weather
//
//  Created by lucas.firmo on 6/18/20.
//  Copyright © 2020 domene. All rights reserved.
//

protocol Fadable {
    func fadeIn()
    func fadeOut()
}

extension Fadable where Self: UIView {
    func fadeIn() {
        UIView.animate(withDuration: 1) {
            self.alpha = 1
        }
    }
    
    func fadeOut() {
        UIView.animate(withDuration: 1) {
            self.alpha = 0
        }
    }
}

extension UIView: Fadable {}

