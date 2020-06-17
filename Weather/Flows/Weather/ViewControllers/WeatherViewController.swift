//
//  HomeViewController.swift
//  Weather
//
//  Created by lucas.firmo on 6/15/20.
//  Copyright © 2020 domene. All rights reserved.
//

import UIKit
import Kingfisher

class WeatherViewController: UIViewController {
    
    let viewModel: WeatherViewModel
    var gradientLayer: CAGradientLayer?
    var viewData: WeatherViewData? {
        didSet {
            forecastCollection.reloadData()
        }
    }
    
    lazy var cityLabel: UILabel = {
        let title = UILabel()
        title.font = R.font.sfProRoundedLight(size: 35)
        title.textColor = .white
        return title
    }()
    
    let temperatureView = WeatherTemperatureView()
    
    lazy var forecastCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(
            ForecastCell.self,
            forCellWithReuseIdentifier: "ForecastCell"
        )
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
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
    
    func update(weather: WeatherViewData) {
        viewData = weather
        
        temperatureView.temperatureLabel.text = weather.temperature
        cityLabel.text = "Rio de Janeiro"
        temperatureView.weatherConditionView.conditionLabel.text = weather.condition
        temperatureView.weatherConditionView.iconImageView.kf.setImage(
            with: weather.iconURL,
            placeholder: R.image.weatherCondition()
        )
        
        setBackgroundColor(for: 800)
    }
    
    private func setBackgroundColor(for code: Int = 801) {
        if gradientLayer != nil {
            gradientLayer!.removeFromSuperlayer()
        }
        
        gradientLayer = CAGradientLayer()
        gradientLayer!.shouldRasterize = true
        gradientLayer!.frame = view.bounds
        
        let colors = WeatherColor(code: code).colors
        
        var startColor = colors.dayColor.startColor
        var endColor = colors.dayColor.endColor
        
        if let viewData = viewData, !viewData.isDay {
            startColor = colors.nightColor.startColor
            endColor = colors.nightColor.endColor
        }
        
        gradientLayer!.colors = [startColor, endColor]

        view.layer.insertSublayer(gradientLayer!, at: 0)
    }
    
}

extension WeatherViewController: ViewCodable {
    
    func buildViewHierarchy() {
        view.addSubview(cityLabel)
        view.addSubview(temperatureView)
        view.addSubview(forecastCollection)
    }
    
    func setupConstraints() {
        
        cityLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(70)
            make.centerX.equalToSuperview()
        }
        
        temperatureView.snp.makeConstraints { make in
            make.centerY.equalToSuperview().multipliedBy(0.9)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(200)
        }
        
        forecastCollection.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(120)
            make.bottom.equalToSuperview().inset(60)
        }
        
    }
    
    func additionalSetup() {
        view.backgroundColor = .lightGray
    }
    
}

extension WeatherViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let weather = viewData else { return 0 }
        return weather.forecast.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ForecastCell", for: indexPath) as! ForecastCell
        
        guard let weather = viewData else { return cell }
        let forecast = weather.forecast[indexPath.row]
        
        cell.forecastView.weekdayLabel.text = forecast.weekday
        cell.forecastView.iconImageView.kf.setImage(
            with: forecast.iconURL,
            placeholder: R.image.weatherCondition()
        )
        cell.forecastView.maxTemperatureLabel.text = forecast.maxTemperature
        cell.forecastView.minTemperatureLabel.text = forecast.minTemperature
        
        return cell
    }
    
}

extension WeatherViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 120)
    }
}
