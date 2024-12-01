//
//  AddReviewViewModel.swift
//  MovieApp
//
//  Created by Mayank Negi on 5/26/20.
//

import Foundation

class AddReviewViewModel: ObservableObject {
    
    var title: String = ""
    var text: String = ""

    func addReviewForMovie(viewModel: MovieViewModel) {

        let movie: Movie? = Movie.byId(id: viewModel.id)

        if let movie {
            let review = Review(context: Review.viewContext)
            review.title = title
            review.text = text
            review.movie = movie

            review.save()
        }
    }    
}
