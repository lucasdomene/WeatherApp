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
    
    // MARK: - Properties
    
    let viewModel: WeatherViewModel
    var gradientLayer: CAGradientLayer?
    var currentCity: City?
    var viewData: WeatherViewData? {
        didSet {
            forecastCollection.reloadData()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
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
    
    init(viewModel: WeatherViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        loadRandomCity()
        setBackgroundColor()
        forecastCollection.configure()
        forecastCollection.delegate = self
        forecastCollection.dataSource = self
    }
    
    private func loadRandomCity() {
        currentCity = viewModel.randomCity()
        viewModel.fetchWeather(for: currentCity!.lat,
                               lon: currentCity!.lon)
        
        fade(animation: .fadeOut)
    }
    
    func update(weather: WeatherViewData) {
        viewData = weather
        
        cityLabel.text = currentCity?.name
        timeLabel.text = weather.time
        temperatureView.set(weather: weather)
        setBackgroundColor(for: weather.code)
        
        fade(animation: .fadeIn)
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype,
                              with event: UIEvent?) {
        loadRandomCity()
    }
    
}

// MARK: - View Codable

extension WeatherViewController: ViewCodable {
    
    func buildViewHierarchy() {
        view.addSubview(cityLabel)
        view.addSubview(timeLabel)
        view.addSubview(temperatureView)
        view.addSubview(forecastCollection)
    }
    
    func setupConstraints() {
        
        cityLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(WeatherViewConstants.cityLabelTop)
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
            make.left.right
                .equalToSuperview()
                .inset(WeatherViewConstants.temperatureEdge)
            make.height.equalTo(WeatherViewConstants.temperatureHeight)
        }
        
        forecastCollection.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(WeatherViewConstants.forecastHeight)
            make.bottom
                .equalToSuperview()
                .inset(WeatherViewConstants.forecastBottom)
        }
        
    }
    
    func additionalSetup() {
        view.backgroundColor = .lightGray
    }
    
}

// MARK: - Collection Data Source

extension WeatherViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let weather = viewData else { return 0 }
        return weather.forecast.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ForecastConstants.cell,
            for: indexPath) as! ForecastCell
        
        guard let weather = viewData else { return cell }
        let forecast = weather.forecast[indexPath.row]
        cell.set(forecast: forecast)
        
        return cell
    }
    
}

// MARK: - Collection Layout

extension WeatherViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ForecastConstants.width,
                      height: ForecastConstants.height)
    }
}

// MARK: - Background Setup

extension WeatherViewController {
    
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

// MARK: - Animations

extension WeatherViewController {
    
    enum Animation {
        case fadeIn
        case fadeOut
    }
    
    func fade(animation: Animation) {
        UIView.animate(withDuration: 1) {
            self.cityLabel.alpha = animation == .fadeIn ? 1 : 0
            self.timeLabel.alpha = animation == .fadeIn ? WeatherViewConstants.timeLabelAlpha : 0
            self.temperatureView.alpha = animation == .fadeIn ? 1 : 0
            self.forecastCollection.alpha = animation == .fadeIn ? 1 : 0
        }
    }
    
}
