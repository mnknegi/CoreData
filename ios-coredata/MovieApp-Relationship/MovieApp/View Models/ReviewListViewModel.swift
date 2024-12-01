//
//  ReviewListViewModel.swift
//  MovieApp
//
//  Created by Mayank Negi on 5/26/20.
//

import Foundation
import CoreData

class ReviewListViewModel: ObservableObject {
    
   @Published
    var reviews = [ReviewViewModel]()

    func getReviewsByMovie(viewModel: MovieViewModel) {
        let movie: Movie? = Movie.byId(id: viewModel.id)
        if let movie {
            DispatchQueue.main.async {
                self.reviews = (movie.reviews?.allObjects as! [Review]).map(ReviewViewModel.init)
            }
        }
    }

}

struct ReviewViewModel {
    
    let review: Review

    var id: NSManagedObjectID {
        review.objectID
    }

    var title: String {
        review.title ?? ""
    }

    var text: String {
        review.text ?? ""
    }

    var publishedDate: Date? {
        review.publishedAt
    }

}
