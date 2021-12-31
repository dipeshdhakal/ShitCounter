//
//  ShitConfigViewModel.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 19/12/21.
//

import Foundation
import SwiftUI

class ShitConfigViewModel: ObservableObject {
    
    @Published var shitStartDate = Date()
    @Published var shitEndDate = Date().add(years: 1) ?? Date()
    @Published var goalShitCount: String = ""
    @Published var saveButtonEnabled: Bool = false
    @Published var shitSet: Bool = false
    
    init() {
        updateShitStatus()
        NotificationCenter.default.addObserver(self, selector: #selector(updateShitStatus), name: .ShitConfigUpdated, object: nil)
    }
    
    @objc
    func updateShitStatus() {
        if let shitStatus = PersistenceProvider.default.shitStatus {
            shitSet = true
            goalShitCount = "\(shitStatus.goalNumber)"
            shitStartDate = shitStatus.startDate ?? Date()
            shitEndDate = shitStatus.endDate ?? Date().add(years: 1) ?? Date()
        } else {
            shitSet = false
            goalShitCount = ""
            shitStartDate = Date()
            shitEndDate = Date().add(years: 1) ?? Date()
        }
    }
    
    
    func saveShitConfig() {
        PersistenceProvider.default.saveShitStatus(startDate: shitStartDate, endDate: shitEndDate, goalNumber: Int64(goalShitCount) ?? -1)
    }
    
    func updateButtonState() {
        saveButtonEnabled = !goalShitCount.isEmpty
    }
    
}
