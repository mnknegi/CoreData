//
//  BudgetListScreen.swift
//  BudgetApp
//
//  Created by Mayank Negi on 03/12/24.
//

import SwiftUI

struct BudgetListScreen: View {

    @FetchRequest(sortDescriptors: []) private var budgets: FetchedResults<Budget>
    @State private var isPresented = false

    var body: some View {
        NavigationStack {
            VStack {
                List(budgets) { budget in
                    Text(budget.title ?? "")
                }
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
    .environment(\.managedObjectContext, CoreDataProvider.preview.context)
}
