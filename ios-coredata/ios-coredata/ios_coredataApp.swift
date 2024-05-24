//
//  ios_coredataApp.swift
//  ios-coredata
//
//  Created by Mayank Negi on 19/08/23.
//

import SwiftUI

@main
struct ios_coredataApp: App {

    var body: some Scene {
        WindowGroup {
            MovieListScreen(coreData: CoreDataManager())
        }
    }
}
