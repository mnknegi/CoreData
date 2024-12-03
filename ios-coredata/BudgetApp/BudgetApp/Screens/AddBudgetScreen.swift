//
//  AddBudgetScreen.swift
//  BudgetApp
//
//  Created by Mayank Negi on 03/12/24.
//

import SwiftUI

struct AddBudgetScreen: View {

    @State private var title: String = ""
    @State private var limit: Double?

    private var isFormValid: Bool {
        !title.isEmpty && limit != nil && Double(limit!) > 0
    }

    var body: some View {
        Form {
            Text("New Budget")
                .font(.headline)

            TextField("Title", text: $title)
                .presentationDetents([.medium])

            TextField("Limit", value: $limit, format: .number)
                .keyboardType(.numberPad)

            Button {
                // action
            } label: {
                Text("Save")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .disabled(!isFormValid)
            .presentationDetents([.medium])
        }
    }
}

#Preview {
    AddBudgetScreen()
}
