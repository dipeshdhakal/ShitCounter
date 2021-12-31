//
//  PersistenceProvider.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 24/10/21.
//

import Foundation
import CoreData

final class PersistenceProvider {
    
    enum StoreType {
        case inMemory, persisted
    }
    
    static var managedObjectModel: NSManagedObjectModel = {
        
        let bundle = Bundle(for: PersistenceProvider.self)
        guard let url = bundle.url(forResource: "ShitCounter", withExtension: "momd") else {
            fatalError("Failed to locate momd file for Shit Counter")
        }
        guard let model = NSManagedObjectModel(contentsOf: url) else {
            fatalError("Failed to load momd file for Shit Counter")
        }
        return model
    }()
    
    let persistentContainer: NSPersistentContainer
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    var backgroundContext: NSManagedObjectContext { persistentContainer.newBackgroundContext() }
    
    static let `default`: PersistenceProvider = PersistenceProvider()
    
    init(storeType: StoreType = .persisted) {
        persistentContainer = NSPersistentCloudKitContainer(name: "ShitCounter", managedObjectModel: Self.managedObjectModel)
        persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
        persistentContainer.viewContext.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
        if storeType == .inMemory {
            persistentContainer.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        persistentContainer.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Failed loading persistent stores with error: \(error.localizedDescription)")
            }
        }
    }
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
