//
//  HomeViewController.swift
//  Weather
//
//  Created by lucas.firmo on 6/15/20.
//  Copyright © 2020 domene. All rights reserved.
//

import UIKit
import Kingfisher

protocol WeatherViewType: class {
    func update(weather: WeatherViewData)
}

class WeatherViewController: UIViewController, WeatherViewType {
    
    // MARK: - Properties
    
    let viewModel: WeatherViewModelType
    var gradientLayer: CAGradientLayer?
    var currentCity: City?
    var viewData: WeatherViewData? {
        didSet {
            DispatchQueue.main.async {
                self.weatherView.forecastCollection.reloadData()
            }
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Views
    
   let weatherView = WeatherView()
    
    // MARK: - Init
    
    init(viewModel: WeatherViewModelType) {
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
        weatherView.forecastCollection.configure()
        weatherView.forecastCollection.delegate = self
        weatherView.forecastCollection.dataSource = self
    }
    
    private func loadRandomCity() {
        currentCity = viewModel.randomCity()
        
        guard let city = currentCity else {
            return
        }
        
        viewModel.fetchWeather(for: city.lat,
                               lon: city.lon)
        
        fade(animation: .fadeOut)
    }
    
    func update(weather: WeatherViewData) {
        viewData = weather
        
        DispatchQueue.main.async {
            self.weatherView.cityLabel.text = self.currentCity?.name
            self.weatherView.timeLabel.text = weather.time
            self.weatherView.temperatureView.set(weather: weather)
            self.setBackgroundColor(for: weather.code)
            
            self.fade(animation: .fadeIn)
        }
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype,
                              with event: UIEvent?) {
        loadRandomCity()
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

extension WeatherViewController: ViewCodable {
    func buildViewHierarchy() {
        view.addSubview(weatherView)
    }
    
    func setupConstraints() {
        weatherView.snp.makeConstraints { make in
            make.top
                .equalToSuperview()
                .inset(WeatherViewConstants.cityLabelTop)
            make.left.right.equalToSuperview()
            make.bottom
                .equalToSuperview()
                .inset(WeatherViewConstants.cityLabelTop)
        }
    }
    
    func additionalSetup() {}
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
            self.weatherView.alpha = animation == .fadeIn ? 1 : 0
        }
    }
    
}
