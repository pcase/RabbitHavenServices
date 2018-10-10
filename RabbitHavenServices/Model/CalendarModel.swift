//
//  CalendarModel.swift
//  RabbitHavenServices
//
//  Created by Patty Case on 10/9/18.
//  Copyright © 2018 Azure Horse Creations. All rights reserved.
//

import Foundation

protocol CalendarDelgate {
}

class CalendarModel {
    
    var delegate: CalendarDelgate?
    
    func arrayOfDates() -> NSArray {
        
        let numberOfDays: Int = 14
        let startDate = Date()
        let formatter: DateFormatter = DateFormatter()
//        formatter.dateFormat = "EEE d/M"
        formatter.dateFormat = "M/d"
        let calendar = Calendar.current
        var offset = DateComponents()
        var dates: [Any] = [formatter.string(from: startDate)]
        
        for i in 1..<numberOfDays {
            offset.day = i
            let nextDay: Date? = calendar.date(byAdding: offset, to: startDate)
            let nextDayString = formatter.string(from: nextDay!)
            dates.append(nextDayString)
        }
        return dates as NSArray
    }
}
