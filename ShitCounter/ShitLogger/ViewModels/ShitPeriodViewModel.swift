//
//  StepCountManager.swift
//  StepCounter
//
//  Created by Anik on 18/8/20.
//

import SwiftUI

enum ShitPeriod: Hashable {
    
    case today(value: Int)
    case weekly(value: Int)
    case overall(value: Int)
    
    var title: String {
        switch self {
        case .today:
            return "Today"
        case .weekly:
            return "Week"
        case .overall:
            return "Overall"
        }
    }
    
    var iconName: String {
        switch self {
        case .today:
            return "calendar-day"
        case .weekly:
            return "calendar-week"
        case .overall:
            return "calendar-month"
        }
    }
    
    var value: Int {
        switch self {
        case .today(let value):
            return value
        case .weekly(let value):
            return value
        case .overall(let value):
            return value
        }
    }
    
    var color: Color {
        switch self {
        case .today:
            return .green
        case .weekly:
            return .blue
        case .overall:
            return .purple
        }
    }
}

class ShitPeriodViewModel: ObservableObject {
    
    @Published var periods: [ShitPeriod] = []
    
    init() {
        calculateData()
    }
    
    func calculateData() {
        let todayCount = PersistenceProvider.default.todayLogsCount ?? -1
        let weekCount = PersistenceProvider.default.weekLogsCount ?? -1
        let overallCount = PersistenceProvider.default.overallLogsCount ?? -1
        periods = [.today(value: todayCount), .weekly(value: weekCount), .overall(value: overallCount)]
    }
    
}
