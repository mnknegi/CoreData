//
//  ContentView.swift
//  ios-coredata
//
//  Created by Mayank Negi on 19/08/23.
//

import SwiftUI
import CoreData

struct MovieListScreen: View {

    let coreData: CoreDataManager
    @State private var movieName: String = ""
    @State private var movies: [Movie] = [Movie]()
    @State private var listNeedsRefresh = false

    private func populateMovies() {
        self.movies = coreData.getAllMovies()
    }

    private func clearEnterMovieField() {
        movieName = ""
    }

    var body: some View {
        NavigationStack {
            VStack {
                TextField("Enter the movie title", text: $movieName)
                    .textFieldStyle(.roundedBorder)
                Button("Save") {
                    coreData.save(title: movieName)
                    self.populateMovies()
                    self.clearEnterMovieField()
                }

                List {
                    ForEach(movies, id: \.self) { movie in
                        NavigationLink {
                            MovieDetailScreen(movie: movie, 
                                              cdManager: coreData,
                                              listNeedsRefresh: $listNeedsRefresh)
                        } label: {
                            Text(movie.title ?? "")
                        }
                    }
                    .onDelete { indexSet in
                        indexSet.forEach { index in
                            let movie = movies[index]
                            coreData.delete(movie: movie)
                            self.populateMovies()
                        }
                    }
                    .onMove { from, to in
                        movies.move(fromOffsets: from, toOffset: to)
                    }
                }
                .listStyle(.plain)

                Spacer()
            }
            .padding()
            .onAppear() {
                self.populateMovies()
            }
            .tint(listNeedsRefresh ? .white : .black)
            .navigationTitle("Movie List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen(coreData: CoreDataManager())
    }
}
