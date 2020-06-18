//
//  ErrorViewTests.swift
//  WeatherTests
//
//  Created by lucas.firmo on 6/18/20.
//  Copyright © 2020 domene. All rights reserved.
//

import XCTest
import SnapshotTesting

@testable import Weather

class ErrorViewTests: XCTestCase {

    func testErrorView() {
        let size = CGSize(width: 200, height: 150)
        let errorView = ErrorView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        errorView.messageLabel.text = "Ops! Check your internet connection"
        errorView.imageView.image = R.image.error()
        
        assertSnapshot(matching: errorView,
                       as: .image,
                       record: false)
    }

}
