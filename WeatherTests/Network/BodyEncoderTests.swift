//
//  BodyEncoderTests.swift
//  WeatherTests
//
//  Created by lucas.firmo on 6/17/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

import XCTest
@testable import Weather

class BodyEncoderTests: XCTestCase {

    func testSuccessfulEncode() {
        let encoder = BodyEncoder()
        let urlRequest = URLRequest(url: URL(string: "test")!)
        let parameters: [String: Int] = ["first": 1, "second": 2]
        
        do {
            let newURLRequest = try encoder.encode(
                urlRequest,
                parameters: parameters
            )
            
            let data = newURLRequest.httpBody!
            let newParameters = try JSONSerialization.jsonObject(
                with: data,
                options: .allowFragments
            ) as! [String: Int]
            
            XCTAssert(newParameters == parameters)
        } catch {
            XCTFail("Should be able to encode")
        }
    }
    
}
