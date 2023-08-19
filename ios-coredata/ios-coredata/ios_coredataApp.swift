//
//  ios_coredataApp.swift
//  ios-coredata
//
//  Created by Mayank Negi on 19/08/23.
//

import SwiftUI

@main
struct ios_coredataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
