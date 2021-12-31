//
//  ShitLog+CoreDataClass.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 11/3/21.
//


import Foundation
import UIKit
import CoreData

@objc(ShitLog)
public class ShitLog: NSManagedObject {

    func delete(context: NSManagedObjectContext) {
        context.delete(self)
        try? context.save()
    }
}

extension PersistenceProvider {
        
    var shitLogs: [ShitLog]? {
        let request: NSFetchRequest<ShitLog> = ShitLog.fetchRequest()
        return try? context.fetch(request)
    }
    
    var todayLogsCount: Int? {
        
        guard shitStatus != nil else {
            return nil
        }
        
        let request: NSFetchRequest<ShitLog> = ShitLog.fetchRequest()
        request.predicate = getDatePredicate(fromDate: Date(), toDate: Date())
        return try? context.fetch(request).count
    }
    
    var weekLogsCount: Int? {
        
        guard shitStatus != nil else {
            return nil
        }
        
        let request: NSFetchRequest<ShitLog> = ShitLog.fetchRequest()
        request.predicate = getDatePredicate(fromDate: Date().startOfWeek() ?? Date(), toDate: Date())
        return try? context.fetch(request).count
    }
    
    var monthLogsCount: Int? {
        
        guard shitStatus != nil else {
            return nil
        }
        
        let request: NSFetchRequest<ShitLog> = ShitLog.fetchRequest()
        request.predicate = getDatePredicate(fromDate: Date().startOfMonth, toDate: Date())
        return try? context.fetch(request).count
    }
    
    var overallLogsCount: Int? {
        
        guard shitStatus != nil else {
            return nil
        }
        
        return shitLogs?.count
    }
    
    func addShitLog(shitDate: Date = Date(), note: String? = nil) {
        let shitLog = ShitLog(context: PersistenceProvider.default.context)
        shitLog.date = shitDate
        shitLog.note = note?.isEmpty ?? false ? nil : note
        try? context.save()
        NotificationCenter.default.post(name: .ShitConfigUpdated, object: nil)
    }
    
    func deleteAllLogs() {
        for log in shitLogs ?? [] {
            log.delete(context: context)
        }
        NotificationCenter.default.post(name: .ShitConfigUpdated, object: nil)
    }
    
    func getShitLogs(date: Date) -> [ShitLog]? {
        let request: NSFetchRequest<ShitLog> = ShitLog.fetchRequest()
        request.predicate = getDatePredicate(fromDate: date.startOfTheDay, toDate: date.endOfTheDay)
        guard let shitLogs = try? context.fetch(request), shitLogs.count > 0 else {
            return nil
        }
        return shitLogs
    }
    
    func getDatePredicate(fromDate: Date, toDate: Date) -> NSCompoundPredicate {
        let fromPredicate = NSPredicate(format: "\(#keyPath(ShitLog.date)) >= %@ ", argumentArray: [fromDate.startOfTheDay as NSDate])
        let toPredicate = NSPredicate(format: "\(#keyPath(ShitLog.date)) <= %@ ", argumentArray: [toDate as NSDate])
        return NSCompoundPredicate(andPredicateWithSubpredicates: [fromPredicate, toPredicate])
    }
}
