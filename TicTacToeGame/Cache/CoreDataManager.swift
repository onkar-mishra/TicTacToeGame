//
//  CoreDataManager.swift
//  TicTacToeGame
//
//  Created by Onkar Mishra on 10/04/24.
//

import CoreData
import UIKit

protocol CoreDataManagerStorageProvider {
    func create<T: NSManagedObject>() -> T
    func fetch<T: NSManagedObject>(predicate: NSPredicate?) -> [T]
    func save()
    func delete<T: NSManagedObject>(_ object: T)
}

class CoreDataManager {
    
    static let shared = CoreDataManager()

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TicTacToeGame")
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
}

extension CoreDataManager: CoreDataManagerStorageProvider {
    
    func create<T: NSManagedObject>() -> T {
        let entityName = String(describing: T.self)
        guard let entity = NSEntityDescription.entity(forEntityName: entityName, in: context) else {
            fatalError("Could not find entity description for \(entityName)")
        }
        return T(entity: entity, insertInto: context)
    }
    
    func fetch<T: NSManagedObject>(predicate: NSPredicate? = nil) -> [T] {
        let entityName = String(describing: T.self)
        let fetchRequest = NSFetchRequest<T>(entityName: entityName)
        fetchRequest.predicate = predicate
        do {
            return try context.fetch(fetchRequest)
        } catch {
            fatalError("Failed to fetch entities: \(error)")
        }
    }
    
    func save() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                fatalError("Failed to save context: \(error)")
            }
        }
    }
    
    func delete<T: NSManagedObject>(_ object: T) {
        context.delete(object)
        save()
    }
}
