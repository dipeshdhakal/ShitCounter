//
//  ShitLog+CoreDataProperties.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 11/3/21.
//

import Foundation
import CoreData


extension ShitLog {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ShitLog> {
        return NSFetchRequest<ShitLog>(entityName: "ShitLog")
    }

    @NSManaged public var date: Date
    @NSManaged public var note: String?

}

extension ShitLog : Identifiable {
}
