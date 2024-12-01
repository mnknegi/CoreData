//
//  ReviewListScreen.swift
//  MovieApp
//
//  Created by Mayank Negi on 5/26/20.
//

import SwiftUI

struct ReviewListScreen: View {
    
    @StateObject
    var viewModel = ReviewListViewModel()
    @State private var isPresented: Bool = false
    var movie: MovieViewModel

    var body: some View {
        VStack {
            List(viewModel.reviews, id: \.id) { review in
                HStack {
                    VStack(alignment: .leading) {
                        Text(review.title)
                            .font(.title2)
                            .fontWeight(.bold)
                        Text(review.text)
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                    }
                    Spacer() 
                    Text(review.publishedDate!.asFormattedString())
                }
            }
        }
        .navigationTitle(movie.title)
        .navigationBarItems(trailing: Button("Add New Review") {
             isPresented = true
        })
        .sheet(isPresented: $isPresented, onDismiss: {
            viewModel.getReviewsByMovie(viewModel: movie)
        }, content: {
            AddReviewScreen(movie: movie)
        })
        .onAppear(perform: {
            viewModel.getReviewsByMovie(viewModel: movie)
        })
    }
}

struct ReviewListScreen_Previews: PreviewProvider {
    static var previews: some View {
        let movie = MovieViewModel(movie: Movie(context: CoreDataStack.shared.viewContext))
        ReviewListScreen(movie: movie).embedInNavigationView()
    }
}
