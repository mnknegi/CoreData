//
//  BudgetListScreen.swift
//  BudgetApp
//
//  Created by Mayank Negi on 03/12/24.
//

import SwiftUI

struct BudgetListScreen: View {

    @State private var isPresented = false

    var body: some View {
        NavigationStack {
            VStack {
                Text("Budget will display here...")
            }
            .navigationTitle("Budget")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Budget") {
                        isPresented = true
                    }
                }
            }
            .sheet(isPresented: $isPresented, content: {
                AddBudgetScreen()
            })
        }
    }
}

#Preview {
    NavigationStack {
        BudgetListScreen()
    }
}
