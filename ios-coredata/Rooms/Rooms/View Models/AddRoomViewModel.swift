//
//  AddRoomViewModel.swift
//  Rooms
//
//  Created by Mayank Negi on 26/05/24.
//

import Foundation
import SwiftUI

final class AddRoomViewModel: ObservableObject {

    @Published var name: String = ""
    @Published var width: String = ""
    @Published var length: String = ""
    @Published var color: Color = Color.clear

    private let cdManager: CoreDataManager

    init(cdManager: CoreDataManager = .shared) {
        self.cdManager = cdManager
    }

    func saveRoom() {
        let room = Room(context: cdManager.viewContext)
        room.name = name
        room.width = Double(width)  ?? 0.0
        room.lenght = Double(length) ?? 0.0
        room.color = UIColor(color)
        cdManager.save()
    }

}
