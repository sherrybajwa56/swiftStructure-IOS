//
//  NSDate+MB.swift
//  structureCoversionDemo
//
//  Created by Mobikasa on 08/09/17.
//  Copyright © 2017 mobikasa. All rights reserved.
//

import Foundation

let componentFlags: Set<Calendar.Component> = [.year,.month,.day,.weekday,.hour,.minute,.second,.weekdayOrdinal]

extension Date {
    
    static let D_MINUTE = 60
    static let D_HOUR   = 3600
    static let D_DAY    = 86400
    static let D_WEEK   = 604800
    static let D_YEAR   = 31556926
    
//    let componentFlags: UInt = (YearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit)
    
    
    
    static var currentCalender: Calendar {
        var sharedCalendar: Calendar? = nil
        if sharedCalendar == nil {
            sharedCalendar = Calendar.autoupdatingCurrent
        }
        sharedCalendar?.timeZone = NSTimeZone.default
        sharedCalendar?.locale = NSLocale.current
        return sharedCalendar!
     }
    
// MARK: Relative Dates
    
    static func dateWithDaysFromNow(days :Int) -> Date{
        
        return dateByAddingDays(dDays:days)
    }
    
    static func dateWithdaysBeforeNow(days :Int) -> Date{
        
        return dateBySubtractingDays(dDays:days)
        
    }
    
    static func dateByAddingDays(dDays :Int) -> Date{
        
        return (Calendar.current as NSCalendar).date(byAdding: .day, value: dDays, to: Date(), options: [])!
        
    }
    static func dateBySubtractingDays(dDays :Int) -> Date{
    
        return dateByAddingDays(dDays: dDays * -1)
        
    }

    static func dateTomorrow() -> Date {
        return dateWithDaysFromNow(days: 1)
    }
    
    static func dateYesterday() -> Date {
        return dateWithdaysBeforeNow(days: 1)
    }
    
    static func dateWith(hoursFromNow dHours: Int) -> Date{
    
        let aTimeInterval: TimeInterval = TimeInterval(Float(Date().timeIntervalSinceReferenceDate) + Float(Date.D_HOUR * dHours))
        
        let newDate = Date(timeIntervalSinceReferenceDate: aTimeInterval)
        
        return newDate
    }
    
    static func dateWith(hoursBeforeNow dHours: Int) -> Date{
        
        let aTimeInterval: TimeInterval = TimeInterval(Float(Date().timeIntervalSinceReferenceDate) - Float(Date.D_HOUR * dHours))
        
        let newDate = Date(timeIntervalSinceReferenceDate: aTimeInterval)
        
        return newDate
    }

    static func dateWith(minutesFromNow dMinutes: Int) -> Date{
        
        let aTimeInterval: TimeInterval = TimeInterval(Float(Date().timeIntervalSinceReferenceDate) + Float(Date.D_MINUTE * dMinutes))
        
        let newDate = Date(timeIntervalSinceReferenceDate: aTimeInterval)
        
        return newDate
    }
    
    static func dateWith(minutesBeforeNow dMinutes: Int) -> Date{
        
        let aTimeInterval: TimeInterval = TimeInterval(Float(Date().timeIntervalSinceReferenceDate) - Float(Date.D_MINUTE * dMinutes))
        
        let newDate = Date(timeIntervalSinceReferenceDate: aTimeInterval)
        
        return newDate
    }
    
    
    func stringWithDateStyle(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }

    func stringWithDateStyle(dateStyle: DateFormatter.Style, time timeStyle: DateFormatter.Style) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        return formatter.string(from: self)
    }
    
    var shortString : String {
        
        return self.stringWithDateStyle(dateStyle:.short, time: .short)
    }
    
    var  shortTimeString : String{
        
        return self.stringWithDateStyle(dateStyle: .none, time: .short)
    }
    
    var shortDateString : String {
        
        return self.stringWithDateStyle(dateStyle: .short, time: .none)
    }
    
    var mediumString : String {
        
        return self.stringWithDateStyle(dateStyle: .medium, time: .medium)
    }
    var mediumTimeString : String {
        
        return self.stringWithDateStyle(dateStyle: .none, time: .medium)
    }
    var mediumDateString : String {
        
        return self.stringWithDateStyle(dateStyle: .medium, time: .none)
    }
    var longString : String {
        
        return self.stringWithDateStyle(dateStyle: .long, time: .long)
    }
    var longTimeString : String {
        
        return self.stringWithDateStyle(dateStyle: .none, time: .long)
    }
  
    var longDateString : String {
        
        return self.stringWithDateStyle(dateStyle: .long, time: .none)
    }
    
    func isEqualtoDateIgnoringTime(aDate: Date) -> Bool {
        let components1: DateComponents? = Date.currentCalender.dateComponents(componentFlags, from: self)// Date.components(componentFlags, from: self)
        let components2: DateComponents? =  Date.currentCalender.dateComponents(componentFlags, from: aDate)
        return (components1?.year == components2?.year) && (components1?.month == components2?.month) && (components1?.day == components2?.day)
    }
    
    func isToday() -> Bool {
        return isEqualtoDateIgnoringTime(aDate: Date())
    }
    
    func isTomorrow() -> Bool {
        return isEqualtoDateIgnoringTime(aDate: Date.dateTomorrow())
    }
    
    func isYesterday() -> Bool {
        return isEqualtoDateIgnoringTime(aDate: Date.dateYesterday())
    }
    
    
    func isInSameWeek(date: Date) -> Bool {
        return Calendar.current.isDate(self, equalTo: date, toGranularity: .weekOfYear)
    }
    func isInSameMonth(date: Date) -> Bool {
        return Calendar.current.isDate(self, equalTo: date, toGranularity: .month)
    }
    func isInSameYear(date: Date) -> Bool {
        return Calendar.current.isDate(self, equalTo: date, toGranularity: .year)
  }
    
    func isThisYear() -> Bool {
        // Thanks, baspellis
        return isInSameYear(date: Date())
    }
    
    func isNextYear() -> Bool {
        let components1: DateComponents? = Date.currentCalender.dateComponents([.year], from: self)
        //.components(NSYearCalendarUnit, from: self)
        let components2: DateComponents? = Date.currentCalender.dateComponents([.year], from: Date())
        
        return ((components1?.year)! == ((components2?.year)! + 1))
    }
    
    func isLastYear() -> Bool {
        let components1: DateComponents? = Date.currentCalender.dateComponents([.year], from: self)
        let components2: DateComponents? = Date.currentCalender.dateComponents([.year], from: Date())
        return ((components1?.year)! == ((components2?.year)! - 1))
    }

    
    
}
