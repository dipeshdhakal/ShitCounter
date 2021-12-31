//
//  ShitStatus+CoreDataClass.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 11/3/21.
//

import Foundation
import UIKit
import CoreData

@objc(ShitStatus)
public class ShitStatus: NSManagedObject {

    func delete() {
        let context = PersistenceProvider.default.context
        context.delete(self)
        try? context.save()
    }
}

extension PersistenceProvider {
    
    var shitStatus: ShitStatus? {
        let request: NSFetchRequest<ShitStatus> = ShitStatus.fetchRequest()
        return try? PersistenceProvider.default.context.fetch(request).first
    }
    
    func deleteConfig() {
        shitStatus?.delete()
        NotificationCenter.default.post(name: .ShitConfigUpdated, object: nil)
    }
    
    func saveShitStatus(startDate: Date, endDate: Date, goalNumber: Int64) {
        
        var currentShitStatus: ShitStatus
        if shitStatus != nil {
            currentShitStatus = shitStatus!
        } else {
            currentShitStatus = ShitStatus(context: context)
            currentShitStatus.id = UUID()
        }
        
        currentShitStatus.startDate = startDate
        currentShitStatus.endDate = endDate
        currentShitStatus.goalNumber = goalNumber
        
        try? context.save()
        NotificationCenter.default.post(name: .ShitConfigUpdated, object: nil)
    }
    
}
