//
//  TodoApp.swift
//  Todo
//
//  Created by Mayank Negi on 10/24/23.
//

import SwiftUI

@main
struct TodoApp: App {

    let provider = CoreDataProvider()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
                    .environment(\.managedObjectContext, provider.viewContext)
            }
        }
    }
}
