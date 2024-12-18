//
//  CoreDataStack.swift
//  MovieApp
//
//  Created by Mayank Negi on 4/23/24.
//

import Foundation
import CoreData
import SwiftUI

class CoreDataStack {
    
    let persistentContainer: NSPersistentContainer
    
    static let shared = CoreDataStack()
    
    private init() {
        
        persistentContainer = NSPersistentContainer(name: "MovieAppModel")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Failed to initialize Core Data \(error)")
            }
        }
        
        let directories = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print(directories[0])
    }

    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext 
    }
    
    /*
    func getMovieById(id: NSManagedObjectID) -> Movie? {
        
        do {
            return try persistentContainer.viewContext.existingObject(with: id) as? Movie
        } catch {
            print(error)
            return nil 
        }
        
    }
    
    func deleteMovie(_ movie: Movie) {
        
        persistentContainer.viewContext.delete(movie)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to delete movie \(error)")
        }
        
    }
    
    func getAllMovies() -> [Movie] {
        
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
        
    }
    
    func save() {
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save a movie \(error)")
        }
    }
     */
}


