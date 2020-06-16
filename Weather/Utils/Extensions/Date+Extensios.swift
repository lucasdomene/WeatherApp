//
//  Date+Extensios.swift
//  Weather
//
//  Created by lucas.firmo on 6/16/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

extension Date {
    
    var weekday: String {
        let dateFormatter = DateFormatter()
        let weekdayIndex = Calendar.current.component(.weekday,
                                                      from: self) - 1
        let weekDaySymbol = dateFormatter.weekdaySymbols[weekdayIndex]
        return String(weekDaySymbol.prefix(3))
    }
    
}
