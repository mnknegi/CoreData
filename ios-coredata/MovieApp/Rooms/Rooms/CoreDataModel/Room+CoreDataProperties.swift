//
//  Room+CoreDataProperties.swift
//  Rooms
//
//  Created by Mayank Negi on 26/05/24.
//
//

import Foundation
import UIKit
import CoreData

extension Room {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Room> {
        return NSFetchRequest<Room>(entityName: "Room")
    }

    @NSManaged public var name: String?
    @NSManaged public var width: Double
    @NSManaged public var lenght: Double
    @NSManaged public var color: UIColor?

}

extension Room : Identifiable {

}
