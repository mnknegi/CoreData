//
//  MovieDetailScreen.swift
//  ios-coredata
//
//  Created by Mayank Negi on 24/05/24.
//

import SwiftUI

struct MovieDetailScreen: View {

    var movie: Movie
    var cdManager: CoreDataManager
    @State private var movieName: String = ""
    @Binding var listNeedsRefresh: Bool

    var body: some View {
        VStack {
            TextField(movie.title ?? "", text: $movieName)
                .textFieldStyle(.roundedBorder)

            Button("Update") {
                if !movieName.isEmpty {
                    movie.title = movieName
                    cdManager.update(movie: movie)
                    listNeedsRefresh.toggle()
                }
            }
        }
        .offset(y: -20.0)
        .padding()
        .navigationTitle("Movie Details")
    }
}

#Preview {
    NavigationStack {
        let cdManager = CoreDataManager()
        MovieDetailScreen(movie: Movie(context: cdManager.persistentContainer.viewContext), cdManager: cdManager, listNeedsRefresh: .constant(false))
    }
}
