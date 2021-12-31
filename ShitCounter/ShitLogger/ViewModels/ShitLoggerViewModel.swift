//
//  ShitLoggerViewModel.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 19/12/21.
//

import Foundation
import SwiftUI
import CoreData

class ShitLoggerViewModel: ObservableObject {
    
    @Published var shitLoggerSetup: Bool = false
    @Published var totalShitCount: Int = 0
    @Published var currentShitCount: Int = 0
    @Published var todayShitCount: Int = 0
    @Published var weekShitCount: Int = 0
    
    init() {
        updateShitStatus()
        NotificationCenter.default.addObserver(self, selector: #selector(updateShitStatus), name: .ShitConfigUpdated, object: nil)
    }
    
    
    @objc
    func updateShitStatus() {
        
        if let shitStatus = PersistenceProvider.default.shitStatus {
            shitLoggerSetup = true
            totalShitCount = Int(shitStatus.goalNumber)
            currentShitCount = PersistenceProvider.default.overallLogsCount ?? 0
        } else {
            shitLoggerSetup = false
            
            // If not setup, wait for 5 sechs and refresh again. This is done to sync Cloud fdata of first install
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.updateShitStatus()
            }
        }
    }
}
