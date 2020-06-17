//
//  WeatherConditionView.swift
//  Weather
//
//  Created by lucas.firmo on 6/15/20.
//  Copyright © 2020 domene. All rights reserved.
//

import UIKit

final class WeatherConditionView: UIView {
    
    // MARK: - Views
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var iconImageView: UIImageView = {
        let icon = UIImageView(frame: .zero)
        return icon
    }()
    
    lazy var conditionLabel: UILabel = {
        let title = UILabel()
        title.font = R.font.sfProRoundedRegular(size: 50)
        title.textColor = .white
        return title
    }()
    
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

extension WeatherConditionView: ViewCodable {
    
    func buildViewHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(conditionLabel)
    }
    
    func setupConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.height.width.equalTo(80)
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func additionalSetup() {}
    
}
