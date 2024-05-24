//
//  CoreDataManager.swift
//  ios-coredata
//
//  Created by Mayank Negi on 19/08/23.
//

import Foundation
import CoreData

final class CoreDataManager {

    let persistentContainer: NSPersistentContainer

    init() {
        self.persistentContainer = NSPersistentContainer(name: "ios_coredata")
        self.persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                preconditionFailure("Persistent Container failed to initialized...\(error.localizedDescription)")
            }
        }
    }

    func save(title: String) {
        let movie = Movie(context: self.persistentContainer.viewContext)
        movie.title = title
        do {
            try self.persistentContainer.viewContext.save()
        } catch {
            print("failed to save movie \(error)")
        }
    }

    func getAllMovies() -> [Movie] {
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        do {
            return try self.persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }

    func delete(movie: Movie) {
        self.persistentContainer.viewContext.delete(movie)
        do {
            try self.persistentContainer.viewContext.save()
        } catch {
            self.persistentContainer.viewContext.rollback()
            print("failed to delete movie \(error)")
        }
    }

    func update(movie: Movie) {
        do {
            try self.persistentContainer.viewContext.save()
        } catch  {
            self.persistentContainer.viewContext.rollback()
        }
    }
}
