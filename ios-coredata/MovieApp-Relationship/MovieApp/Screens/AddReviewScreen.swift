//
//  AddReviewScreen.swift
//  MovieApp
//
//  Created by Mayank Negi on 5/26/20.
//

import SwiftUI

struct AddReviewScreen: View {
    
    @StateObject private var addReviewVM = AddReviewViewModel()
    @Environment(\.presentationMode) var presentationMode

    var movie: MovieViewModel

    var body: some View {
        Form {
            TextField("Enter title", text: $addReviewVM.title)
            TextEditor(text: $addReviewVM.text)

            HStack {
                Spacer()
                Button("Save") {
                    addReviewVM.addReviewForMovie(viewModel: movie)
                    presentationMode.wrappedValue.dismiss()
                }
                Spacer()
            }

        }
        .navigationTitle("Add Review")
        .embedInNavigationView()
    }
}

struct AddReviewScreen_Previews: PreviewProvider {
    static var previews: some View {
        let movie = MovieViewModel(movie: Movie(context: CoreDataStack.shared.viewContext))
        AddReviewScreen(movie: movie)
    }
}
