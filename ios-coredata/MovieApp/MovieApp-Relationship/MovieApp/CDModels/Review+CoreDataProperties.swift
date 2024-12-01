//
//  Review+CoreDataProperties.swift
//  MovieApp
//
//  Created by Mayank Negi on 26/05/24.
//
//

import Foundation
import CoreData


extension Review {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Review> {
        return NSFetchRequest<Review>(entityName: "Review")
    }

    @NSManaged public var title: String?
    @NSManaged public var text: String?
    @NSManaged public var publishedAt: Date?
    @NSManaged public var movie: Movie?

}

extension Review : Identifiable {

}
