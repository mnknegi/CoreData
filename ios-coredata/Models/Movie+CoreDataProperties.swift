//
//  Movie+CoreDataProperties.swift
//  ios-coredata
//
//  Created by Mayank Negi on 24/05/24.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?

}

extension Movie : Identifiable {

}
