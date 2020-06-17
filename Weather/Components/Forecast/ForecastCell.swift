//
//  ForecastCell.swift
//  Weather
//
//  Created by lucas.firmo on 6/16/20.
//  Copyright © 2020 domene. All rights reserved.
//

import UIKit

final class ForecastCell: UICollectionViewCell {
    
    let forecastView = ForecastView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ForecastCell: ViewCodable {
    
    func buildViewHierarchy() {
        contentView.addSubview(forecastView)
    }
    
    func setupConstraints() {
        forecastView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
        
}
