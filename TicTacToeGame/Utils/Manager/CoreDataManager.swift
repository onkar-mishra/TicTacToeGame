//
//  CoreDataManager.swift
//  TicTacToeGame
//
//  Created by Onkar Mishra on 10/04/24.
//
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    private init() {}
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TicTacToeGame")
        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
        })
        return container
    }()
    
    var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func backgroundContext() -> NSManagedObjectContext {
        return persistentContainer.newBackgroundContext()
    }
    
    
    func save(parameters: ParametersToSave) {
        let context = backgroundContext()
        context.perform {
            let entity = NSEntityDescription.entity(forEntityName: "RoundHistory", in: context)!
            let round = NSManagedObject(entity: entity, insertInto: context)
            round.setValue(parameters.player1, forKeyPath: "player1")
            round.setValue(parameters.player2, forKeyPath: "player2")
            round.setValue(parameters.winner, forKeyPath: "winner")
            
            // Save the context after setting the values
            do {
                try context.save()
                print("Data saved successfully.")
            } catch {
                fatalError("Unresolved error \(error)")
            }
        }
    }

    
    func fetchRounds() -> [RoundHistory] {
        let fetchRequest: NSFetchRequest<RoundHistory> = RoundHistory.fetchRequest()
        do {
            let rounds = try mainContext.fetch(fetchRequest)
            return rounds
        } catch {
            print("Error fetching rounds: \(error)")
            return []
        }
    }
}
