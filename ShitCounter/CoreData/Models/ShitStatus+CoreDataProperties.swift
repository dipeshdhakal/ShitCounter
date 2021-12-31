//
//  ShitStatus+CoreDataProperties.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 11/3/21.
//

import Foundation
import CoreData


extension ShitStatus {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ShitStatus> {
        return NSFetchRequest<ShitStatus>(entityName: "ShitStatus")
    }

    @NSManaged public var id: UUID
    @NSManaged public var goalNumber: Int64
    @NSManaged public var lastLogged: Date?
    @NSManaged public var startDate: Date?
    @NSManaged public var endDate: Date?

}

extension ShitStatus : Identifiable {

}
