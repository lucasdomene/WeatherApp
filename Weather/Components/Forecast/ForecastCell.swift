//
//  ForecastCell.swift
//  Weather
//
//  Created by lucas.firmo on 6/16/20.
//  Copyright © 2020 domene. All rights reserved.
//

import UIKit

final class ForecastCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    let forecastView = ForecastView(frame: .zero)
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func set(forecast: ForecastViewData) {
        forecastView.weekdayLabel.text = forecast.weekday
        forecastView.iconImageView.kf.setImage(
            with: forecast.iconURL,
            placeholder: R.image.weatherCondition()
        )
        forecastView.maxTemperatureLabel.text = forecast.maxTemperature
        forecastView.minTemperatureLabel.text = forecast.minTemperature
    }
    
}

// MARK: - View Codable

extension ForecastCell: ViewCodable {

    func buildViewHierarchy() {
        contentView.addSubview(forecastView)
    }
    
    func setupConstraints() {
        forecastView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
      
    func additionalSetup() {}
    
}
