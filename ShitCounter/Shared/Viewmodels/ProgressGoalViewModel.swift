//
//  ProgressGoalViewModel.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 23/12/21.
//

import SwiftUI

class ProgressGoalViewModel: ObservableObject {
    
    @Published var goalProgress: CGFloat = .zero
    @Published var centerTitle: String = "N/A"
    @Published var centerSubtitle: String = "N/A"
    
    init() {
        
        let currentShitCount = PersistenceProvider.default.overallLogsCount ?? 0
        let goalShitCount = PersistenceProvider.default.shitStatus?.goalNumber ?? 0
        
        centerTitle = "\(currentShitCount)"
        centerSubtitle = "Shit goal: \(goalShitCount)"
        goalProgress = CGFloat(currentShitCount) / CGFloat(goalShitCount)
    }
}
