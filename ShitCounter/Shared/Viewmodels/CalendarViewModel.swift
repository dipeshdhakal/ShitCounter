//
//  CalendarViewModel.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 25/12/2021.
//

import SwiftUI

public enum ShitDay {
    
    case shitted(date: Date, count: Int, notes: [String]?)
    case normal(date: Date)
    
    func color(selectedDate: Date) -> Color{
        switch self {
            case .shitted:
                if Calendar.current.isDate(date, inSameDayAs: selectedDate) {
                    return .green
                } else {
                    return Color.accent
                }
            case .normal:
                if Calendar.current.isDate(date, inSameDayAs: selectedDate) {
                    return .green
                } else if Calendar.current.isDateInToday(date){
                    return .green
                } else {
                    return .blue
                }
        }
    }
    
    var date: Date {
        switch self {
            case .shitted(let date,_,_):
                return date
            case .normal(let date):
                return date
        }
    }
    
    var notes: String? {
        switch self {
            case .shitted(_,_,let notes):
                guard let notes = notes, notes.count > 0 else {
                    return nil
                }
                return "Notes: \(notes.map{$0})"
            case .normal:
                return nil
        }
    }
}
