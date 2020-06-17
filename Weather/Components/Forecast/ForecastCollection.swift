//
//  ForecastCollection.swift
//  Weather
//
//  Created by lucas.firmo on 6/16/20.
//  Copyright © 2020 domene. All rights reserved.
//

import UIKit

final class ForecastCollection: UICollectionView {
    
    // MARK: - Init
    
    override init(frame: CGRect,
                  collectionViewLayout layout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func configure() {
        register(
            ForecastCell.self,
            forCellWithReuseIdentifier: "ForecastCell"
        )
        backgroundColor = .clear
        showsHorizontalScrollIndicator = false
    }
    
}
