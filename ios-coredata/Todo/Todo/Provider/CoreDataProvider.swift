//
//  CoreDataProvider.swift
//  Todo
//
//  Created by Mayank Negi on 01/12/24.
//

import Foundation
import CoreData

final class CoreDataProvider {

    let persistentContainer: NSPersistentContainer

    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }

    static var preview: CoreDataProvider = {
        let provider = CoreDataProvider(inMemory: true)
        let viewContext = provider.viewContext

        for index in 1...10 {
            let todoItem = TodoItem(context: viewContext)
            todoItem.title = "TodoItem \(index)"
            todoItem.isCompleted = index % 2 == 0 ? true : false
        }

        do {
            try viewContext.save()
        } catch {
            print(error)
        }

        return provider
    }()

    init(inMemory: Bool = false) {
        self.persistentContainer = NSPersistentContainer(name: "TodoModel")

        if inMemory {
            persistentContainer.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        persistentContainer.loadPersistentStores { _, error in
            if let error {
                fatalError("CoreData can't initialized...\(error)")
            }
        }
    }
}
