//
//  View+Extensions.swift
//  MovieApp
//
//  Created by Mayank Negi on 5/26/20.
//

import Foundation
import SwiftUI

extension View {
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
}
