//
//  ForecastView.swift
//  Weather
//
//  Created by lucas.firmo on 6/16/20.
//  Copyright © 2020 domene. All rights reserved.
//

import UIKit

final class ForecastView: UIStackView {
    
    // MARK: - Views
    
    lazy var weekdayLabel: UILabel = {
        let weekDayLabel = UILabel()
        weekDayLabel.font = R.font.sfProRoundedSemibold(size: 12)
        weekDayLabel.textColor = .white
        return weekDayLabel
    }()
    
    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView(frame: .zero)
        iconImageView.contentMode = .scaleAspectFit
        return iconImageView
    }()
    
    lazy var maxTemperatureLabel: UILabel = {
        let maxTemperatureLabel = UILabel()
        maxTemperatureLabel.font = R.font.sfProRoundedRegular(size: 16)
        maxTemperatureLabel.textColor = .white
        return maxTemperatureLabel
    }()
    
    lazy var minTemperatureLabel: UILabel = {
        let minTemperatureLabel = UILabel()
        minTemperatureLabel.font = R.font.sfProRoundedRegular(size: 16)
        minTemperatureLabel.textColor = .white
        minTemperatureLabel.alpha = 0.6
        return minTemperatureLabel
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - View Codable

extension ForecastView: ViewCodable {
        
    func buildViewHierarchy() {
        addArrangedSubview(weekdayLabel)
        addArrangedSubview(iconImageView)
        addArrangedSubview(maxTemperatureLabel)
        addArrangedSubview(minTemperatureLabel)
    }
    
    func setupConstraints() {}
    
    func additionalSetup() {
        axis = .vertical
        distribution = .fillEqually
        alignment = .center
    }
    
}
