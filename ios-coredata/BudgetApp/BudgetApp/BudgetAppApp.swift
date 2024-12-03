//
//  BudgetAppApp.swift
//  BudgetApp
//
//  Created by Mayank Negi on 11/8/23.
//

import SwiftUI

@main
struct BudgetAppApp: App {
    
    let provider: CoreDataProvider
    
    init() {
        provider = CoreDataProvider()
    }
    
    var body: some Scene {
        WindowGroup {
            BudgetListScreen()
                .environment(\.managedObjectContext, provider.context)
        }
    }
}
