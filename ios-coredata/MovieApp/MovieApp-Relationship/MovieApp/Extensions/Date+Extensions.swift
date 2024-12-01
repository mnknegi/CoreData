//
//  Date+Extensions.swift
//  MovieApp
//
//  Created by Mayank Negi on 5/26/20.
//

import Foundation

extension Date {
    
    func asFormattedString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from: self)
    }
    
}
