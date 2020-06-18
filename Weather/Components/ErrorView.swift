//
//  ErrorView.swift
//  Weather
//
//  Created by lucas.firmo on 6/18/20.
//  Copyright © 2020 domene. All rights reserved.
//

import UIKit

final class ErrorView: UIStackView {
    
    // MARK: - Views
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var messageLabel: UILabel = {
        let messageLabel = UILabel()
        messageLabel.font = R.font.sfProRoundedLight(size: 50)
        messageLabel.textColor = .white
        messageLabel.adjustsFontSizeToFitWidth = true
        messageLabel.alpha = WeatherViewConstants.timeLabelAlpha
        return messageLabel
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

// MARK: - ViewCodable

extension ErrorView: ViewCodable {
    func buildViewHierarchy() {
        addArrangedSubview(imageView)
        addArrangedSubview(messageLabel)
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.height.width.equalTo(90)
        }
    }
    
    func additionalSetup() {
        axis = .vertical
        distribution = .fill
        alignment = .center
    }
}
