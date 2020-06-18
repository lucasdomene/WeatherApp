//
//  DateTests.swift
//  WeatherTests
//
//  Created by lucas.firmo on 6/17/20.
//  Copyright © 2020 domene. All rights reserved.
//

import XCTest
@testable import Weather

class DateTests: XCTestCase {
    
    var date: Date?
    var components: DateComponents!
    
    override func setUp() {
        super.setUp()
        components = DateComponents()
        components.day = 15
        components.month = 6
        components.year = 2020
        components.hour = 5
        components.minute = 30
        
        date = Calendar.current.date(from: components)
    }
    
    override func tearDown() {
        date = nil
        super.tearDown()
    }
    
    func testWeekDay() {
        XCTAssertEqual(date?.weekday, "Mon")
        increment()
        XCTAssertEqual(date?.weekday, "Tue")
        increment()
        XCTAssertEqual(date?.weekday, "Wed")
        increment()
        XCTAssertEqual(date?.weekday, "Thu")
        increment()
        XCTAssertEqual(date?.weekday, "Fri")
        increment()
        XCTAssertEqual(date?.weekday, "Sat")
        increment()
        XCTAssertEqual(date?.weekday, "Sun")
    }
    
    func testFormattedHour() {
        var gmt = date?.formatted(timezoneOffset: 0)
        var gmtMinus3 = date?.formatted(timezoneOffset: -10800)
        var gmtPlus3 = date?.formatted(timezoneOffset: 10800)
        
        XCTAssertEqual(gmt, "8:30 am")
        XCTAssertEqual(gmtMinus3, "5:30 am")
        XCTAssertEqual(gmtPlus3, "11:30 am")
        
        incrementHour()
        
        gmt = date?.formatted(timezoneOffset: 0)
        gmtMinus3 = date?.formatted(timezoneOffset: -10800)
        gmtPlus3 = date?.formatted(timezoneOffset: 10800)
        
        XCTAssertEqual(gmt, "8:30 pm")
        XCTAssertEqual(gmtMinus3, "5:30 pm")
        XCTAssertEqual(gmtPlus3, "11:30 pm")
    }
    
    private func increment() {
        components.day! += 1
        date = Calendar.current.date(from: components)
    }
    
    private func incrementHour() {
        components.hour = 17
        date = Calendar.current.date(from: components)
    }
    
}
