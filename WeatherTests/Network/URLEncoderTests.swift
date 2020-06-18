//
//  URLEncoderTests.swift
//  WeatherTests
//
//  Created by lucas.firmo on 6/17/20.
//  Copyright © 2020 domene. All rights reserved.
//

import XCTest
@testable import Weather

class URLEncoderTests: XCTestCase {
    
    func testSuccessfulEncode() {
        let encoder = URLEncoder()
        let baseURLString = NetworkConstants.baseURL
        let urlRequest = URLRequest(url: URL(string: baseURLString)!)
        let parameters: Parameters  = ["first": 1, "second": "2"]
        
        do {
            let newURLRequest = try encoder.encode(urlRequest,
            parameters: parameters)
            guard let url = newURLRequest.url?.absoluteString else {
                XCTFail("Should be able to encode url")
                return
            }
            
            XCTAssert(url.contains("first=1"))
            XCTAssert(url.contains("second=2"))
            
        } catch {
            XCTFail("Should be able to encode url")
        }
        
    }
    
    func testFailingEncode() {
        let encoder = URLEncoder()
        var urlRequest = URLRequest(url: URL(string: "test")!)
        urlRequest.url = nil
        
        do {
            _ = try encoder.encode(urlRequest, parameters: [:])
            XCTFail("Should no be able to encode")
        } catch {
            XCTAssert(true)
        }
    
    }
    
}
