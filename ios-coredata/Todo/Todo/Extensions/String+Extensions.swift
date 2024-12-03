//
//  String+Extensions.swift
//  Todo
//
//  Created by Mayank Negi on 01/12/24.
//

import Foundation

extension String {
    var isEmptyOrWhitespace: Bool {
        trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
