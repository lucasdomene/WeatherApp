//
//  WeatherView.swift
//  Weather
//
//  Created by lucas.firmo on 6/18/20.
//  Copyright © 2020 domene. All rights reserved.
//

import UIKit

final class WeatherView: UIView {

    // MARK: - Views
    
    lazy var cityLabel: UILabel = {
        let title = UILabel()
        title.font = R.font.sfProRoundedLight(
            size: WeatherViewConstants.cityLabelSize
        )
        title.textColor = .white
        return title
    }()
    
    lazy var timeLabel: UILabel = {
        let time = UILabel()
        time.font = R.font.sfProRoundedLight(
            size: WeatherViewConstants.timeLabelSize
        )
        time.textColor = .white
        time.alpha = WeatherViewConstants.timeLabelAlpha
        return time
    }()
    
    let temperatureView = WeatherTemperatureView()
    
    let forecastCollection = ForecastCollection()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - View Codable

extension WeatherView: ViewCodable {
    
    func buildViewHierarchy() {
        addSubview(cityLabel)
        addSubview(timeLabel)
        addSubview(temperatureView)
        addSubview(forecastCollection)
    }
    
    func setupConstraints() {
        
        cityLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        timeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top
                .equalTo(cityLabel.snp.bottom)
                .offset(WeatherViewConstants.timeLabelTop)
        }
        
        temperatureView.snp.makeConstraints { make in
            make.centerY
                .equalToSuperview()
                .multipliedBy(WeatherViewConstants.temperatureCenterY)
            make.left.right.equalToSuperview()
            make.height.equalTo(WeatherViewConstants.temperatureHeight)
        }
        
        forecastCollection.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(WeatherViewConstants.forecastHeight)
        }
        
    }
    
    func additionalSetup() {}
    
}
