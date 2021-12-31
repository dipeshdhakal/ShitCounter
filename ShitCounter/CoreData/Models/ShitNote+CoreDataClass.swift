//
//  ShitNote+CoreDataClass.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 11/3/21.
//

import Foundation
import UIKit
import CoreData

@objc(ShitNote)
public class ShitNote: NSManagedObject {

    func delete() {
        let context = PersistenceProvider.default.context
        context.delete(self)
        try? context.save()
    }
}

extension PersistenceProvider {
    
    var shitNotes: [ShitNote]? {
        let request: NSFetchRequest<ShitNote> = ShitNote.fetchRequest()
        return try? context.fetch(request)
    }
    
    func getShitNote(id: UUID) -> ShitNote? {
        let request: NSFetchRequest<ShitNote> = ShitNote.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@ ", argumentArray: [id])
        return try? context.fetch(request).first
    }
    
    func saveShitNote(id: UUID? = nil, title: String, details: String) {
        
        var currentShitNote: ShitNote
        if let id = id, let note = getShitNote(id: id) {
            currentShitNote = note
        } else {
            currentShitNote = ShitNote(context: context)
            currentShitNote.id = UUID()
        }
        currentShitNote.date = Date()
        currentShitNote.title = title
        currentShitNote.details = details
        try? context.save()
        NotificationCenter.default.post(name: .ShitNoteUpdated, object: nil)
    }
    
}
