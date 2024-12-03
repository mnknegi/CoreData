//
//  ContentView.swift
//  Todo
//
//  Created by Mayank Negi on 10/24/23.
//

import SwiftUI

struct ContentView: View {

    @Environment(\.managedObjectContext) private var context
    @State private var title = ""
    @FetchRequest(sortDescriptors: []) private var todoItems: FetchedResults<TodoItem>

    private var isFormValid: Bool {
        !title.isEmptyOrWhitespace
    }

    private var pendingTodoItems: [TodoItem] {
        todoItems.filter { !$0.isCompleted }
    }

    private var completedTodoItems: [TodoItem] {
        todoItems.filter { $0.isCompleted }
    }

    private func saveToDoItem() {
        let todoItem = TodoItem(context: context)
        todoItem.title = title

        do {
            try context.save()
        } catch {
            print(error)
        }
    }

    var body: some View {
        VStack {
            TextField("Title", text: $title)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    if isFormValid {
                        saveToDoItem()
                        title = ""
                    }
                }

            List {
                Section("Pending") {

                    if pendingTodoItems.isEmpty {
                        ContentUnavailableView("No Item Found", systemImage: "doc")
                    } else {
                        ForEach(pendingTodoItems) { todoItem in
                            ToDoCellView(todoItem: todoItem, onChange: updateToDoItem)
                        }
                        .onDelete(perform: { indexSet in
                            indexSet.forEach { index in
                                let todoItem = pendingTodoItems[index]
                                delete(todoItem)
                            }
                        })
                    }
                }

                Section("Completed") {
                    if completedTodoItems.isEmpty {
                        ContentUnavailableView("No Item Found", systemImage: "doc")
                    } else {
                        ForEach(completedTodoItems) { todoItem in
                            ToDoCellView(todoItem: todoItem, onChange: updateToDoItem)
                        }
                    }
                }
            }
            .listStyle(.plain)

            Spacer()
        }
        .padding()
        .navigationTitle("TODO")
    }

    private func updateToDoItem(_ todoItem: TodoItem) {
        do {
            try context.save()
        } catch {
            print(error)
        }
    }

    private func delete(_ todoItem: TodoItem) {
        context.delete(todoItem)
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
}

struct ToDoCellView: View {

    let todoItem: TodoItem
    let onChange: (TodoItem) -> Void
    var body: some View {
        HStack {
            Image(systemName: todoItem.isCompleted ? "checkmark.square" : "square")
                .onTapGesture {
                    todoItem.isCompleted.toggle()
                    onChange(todoItem)
                }
            if todoItem.isCompleted {
                Text(todoItem.title ?? "")
            } else {
                TextField("", text: Binding(get: {
                    todoItem.title ?? ""
                }, set: { value in
                    todoItem.title = value
                }))
                .onSubmit {
                    onChange(todoItem)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
            .environment(\.managedObjectContext, CoreDataProvider.preview.viewContext)
    }
}
