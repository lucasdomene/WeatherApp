//
//  WeatherTemperatureView.swift
//  Weather
//
//  Created by lucas.firmo on 6/17/20.
//  Copyright © 2020 domene. All rights reserved.
//

import UIKit

final class WeatherTemperatureView: UIStackView {
    
    // MARK: - Views
    
    let weatherConditionView = WeatherConditionView()
    
    lazy var temperatureLabel: UILabel = {
        let title = UILabel()
        title.font = R.font.sfProRoundedLight(size: 150)
        title.textColor = .white
        return title
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func set(weather: WeatherViewData) {
        temperatureLabel.text = weather.temperature
        weatherConditionView.conditionLabel.text = weather.condition
        weatherConditionView.iconImageView.kf.setImage(
            with: weather.iconURL,
            placeholder: R.image.weatherCondition()
        )
    }
    
}

// MARK: - View Codable

extension WeatherTemperatureView: ViewCodable {
    
    func buildViewHierarchy() {
        addArrangedSubview(weatherConditionView)
        addArrangedSubview(temperatureLabel)
    }
    
    func setupConstraints() {}
    
    func additionalSetup() {
        axis = .vertical
        distribution = .fillProportionally
        alignment = .center
    }
    
}
