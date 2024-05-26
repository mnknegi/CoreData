//
//  RoomListViewModel.swift
//  Rooms
//
//  Created by Mayank Negi on 26/05/24.
//

import Foundation

final class RoomListViewModel: ObservableObject {

    @Published
    var rooms = [RoomViewModel]()

    let cdManager: CoreDataManager

    init(cdManager: CoreDataManager = .shared) {
        self.cdManager = cdManager
    }

    func getAllRooms() {
        let cdRooms = cdManager.getAllRooms()
        DispatchQueue.main.async {
            self.rooms = cdRooms.map(RoomViewModel.init)
        }
    }

    func deleteAllRooms() {
        cdManager.deleteAllRooms()
    }

}
