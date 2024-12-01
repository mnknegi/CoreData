//
//  CoreDataManager.swift
//  Rooms
//
//  Created by Mayank Negi on 26/05/24.
//

import Foundation
import CoreData

final class CoreDataManager {

    private let persistentContainer: NSPersistentContainer

    static let shared = CoreDataManager()

    private init() {

        ValueTransformer.setValueTransformer(UIColorTransformer(), forName: NSValueTransformerName("UIColorTransformer"))

        self.persistentContainer = NSPersistentContainer(name: "RoomModel")
        self.persistentContainer.loadPersistentStores { description, error in
            if let error {
                fatalError("Can't initialize Core Data Stack. \(error.localizedDescription)")
            }
        }
    }

    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }

    func save() {
        do {
            try viewContext.save()
        } catch {
            print("Error while saving operation \(error.localizedDescription)")
            viewContext.rollback()
        }
    }

    func getAllRooms() -> [Room] {

        let fetchRequest: NSFetchRequest<Room> = Room.fetchRequest()

        do {
            return try viewContext.fetch(fetchRequest)
        } catch {
            print("Failed to get all the Rooms \(error.localizedDescription)")
            return []
        }
    }

    func deleteAllRooms() {
        let allRooms = getAllRooms()
        allRooms.forEach(viewContext.delete)
        self.save()
    }

}
