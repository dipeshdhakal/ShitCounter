//
//  ShitNote+CoreDataProperties.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 11/3/21.
//

import Foundation
import CoreData


extension ShitNote {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ShitNote> {
        return NSFetchRequest<ShitNote>(entityName: "ShitNote")
    }
    
    @NSManaged public var id: UUID
    @NSManaged public var date: Date
    @NSManaged public var title: String?
    @NSManaged public var details: String?
    
}

extension ShitNote : Identifiable {
    
}
