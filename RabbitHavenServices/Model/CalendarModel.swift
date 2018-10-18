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
    
    func arrayOfDates(numberOfDays: Int) -> NSArray {
        
        let startDate = Date()
        let formatter: DateFormatter = DateFormatter()
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
    
    func arrayOfTimes(numberOfTimeSlots: Int) -> NSArray {
        var times: [String] = []
        var timeSlots: [String] = ["1:00", "1:10", "1:20", "1:30", "1:40", "1:50", "2:00", "2:10", "2:20", "2:30", "2:40", "2:50", "3:00"]
        for i in 1..<numberOfTimeSlots {
            times.append(timeSlots[i])
        }
        return times as NSArray
    }
}
