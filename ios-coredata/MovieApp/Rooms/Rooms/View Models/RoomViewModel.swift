//
//  RoomViewModel.swift
//  Rooms
//
//  Created by Mayank Negi on 26/05/24.
//

import Foundation
import CoreData
import SwiftUI

struct RoomViewModel {

    let cdRoom: Room

    var id: NSManagedObjectID {
        cdRoom.objectID
    }

    var name: String {
        cdRoom.name ?? "Not Available"
    }

    var width: String {
        String(cdRoom.width)
    }

    var length: String {
        String(cdRoom.lenght)
    }

    var color: Color {
        Color(uiColor: cdRoom.color ?? .clear)
    }
}
