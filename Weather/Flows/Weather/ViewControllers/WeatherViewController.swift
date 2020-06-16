//
//  HomeViewController.swift
//  Weather
//
//  Created by lucas.firmo on 6/15/20.
//  Copyright © 2020 domene. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    let viewModel: WeatherViewModel
    
    lazy var cityLabel: UILabel = {
        let title = UILabel()
        title.font = R.font.sfProRoundedLight(size: 40)
        title.textColor = .white
        return title
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        return stackView
    }()
    
    let weatherConditionView = WeatherConditionView()
    
    lazy var temperatureLabel: UILabel = {
        let title = UILabel()
        title.font = R.font.sfProRoundedLight(size: 150)
        title.textColor = .white
        return title
    }()
    
    init(viewModel: WeatherViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setBackgroundColor()
        viewModel.fetchWeather(for: -22.90278, lon: -43.2075)
    }
    
    func updateWeather(_ weather: WeatherViewData) {
        self.temperatureLabel.text = weather.temperature
        self.cityLabel.text = "Rio de Janeiro"
        self.weatherConditionView.conditionLabel.text = weather.condition
        self.weatherConditionView.iconImageView.image = R.image.weatherCondition()
        self.setBackgroundColor(for: weather.code)
    }
    
    private func setBackgroundColor(for code: Int = 800) {
        let gradientLayer = CAGradientLayer()
        
        let colors = WeatherColor(code: code).colors
        
        gradientLayer.colors = [
            colors.dayColor.startColor,
            colors.dayColor.endColor
        ]
        
        gradientLayer.shouldRasterize = true
        gradientLayer.frame = view.bounds
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}

extension WeatherViewController: ViewCodable {
    
    func buildViewHierarchy() {
        view.addSubview(cityLabel)
        view.addSubview(stackView)
        stackView.addArrangedSubview(weatherConditionView)
        stackView.addArrangedSubview(temperatureLabel)
    }
    
    func setupConstraints() {
        
        cityLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(200)
        }
        
    }
    
    func additionalSetup() {
        view.backgroundColor = .lightGray
    }
    
}
