//
//  Date+Components.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 19/12/21.
//

import Foundation

extension Date {
    
    var formattedString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E, d MMM y"
        return formatter.string(from: self)
    }
    
    var startOfTheDay: Date {
        return Calendar.current.startOfDay(for: self)
    }
    
    var endOfTheDay: Date {
        return Calendar.current.startOfDay(for: self).add(days: 1) ?? self
    }
    
    var startOfMonth: Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }
    
    var endOfMonth: Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth)!
    }
    
    /// Returns a Date with the specified amount of components added to the one it is called with
    func add(years: Int = 0, months: Int = 0, days: Int = 0, hours: Int = 0, minutes: Int = 0, seconds: Int = 0) -> Date? {
        let components = DateComponents(year: years, month: months, day: days, hour: hours, minute: minutes, second: seconds)
        return Calendar.current.date(byAdding: components, to: self)
    }
    
    /// Returns a Date with the specified amount of components subtracted from the one it is called with
    func subtract(years: Int = 0, months: Int = 0, days: Int = 0, hours: Int = 0, minutes: Int = 0, seconds: Int = 0) -> Date? {
        return add(years: -years, months: -months, days: -days, hours: -hours, minutes: -minutes, seconds: -seconds)
    }
    
    enum Weekday: Int {
        case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday
    }
    
    func startOfWeek(_ firstWeekday: Weekday = .monday) -> Date? {
        var cal = Calendar.current
        let dateComponents = cal.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)
        cal.firstWeekday = firstWeekday.rawValue
        return cal.date(from: dateComponents)
    }
    
    func endOfWeek(_ firstWeekday: Weekday = .monday) -> Date? {
        guard let startOfWeek = startOfWeek(firstWeekday) else { return nil }
        var dateComponents = DateComponents()
        dateComponents.weekOfYear = 1
        dateComponents.day = -1
        return Calendar.current.date(byAdding: dateComponents, to: startOfWeek)
    }
    
}
