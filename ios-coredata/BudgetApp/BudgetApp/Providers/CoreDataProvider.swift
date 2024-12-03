//
//  CoreDataProvider.swift
//  BudgetApp
//
//  Created by Mayank Negi on 11/8/23.
//

import Foundation
import CoreData

class CoreDataProvider {
    
    let persistentContainer: NSPersistentContainer
    
    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }

    static var preview: CoreDataProvider = {
        let provider = CoreDataProvider(inMemory: true)
        let context = provider.context

        let budget = Budget(context: context)
        budget.title = "Entertainment"
        budget.amount = 500
        budget.dateCreated = Date()

        do {
            try context.save()
        } catch {
            print(error)
        }

        return provider
    }()

    init(inMemory: Bool = false) {
        
        persistentContainer = NSPersistentContainer(name: "BudgetAppModel")
        
        if inMemory {
            persistentContainer.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        persistentContainer.loadPersistentStores { _, error in
            if let error {
                fatalError("Core Data store failed to initialize \(error)")
            }
        }
    }
}
