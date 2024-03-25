//
//  ContentView.swift
//  SwiftDataExample
//
//  Created by Ashraf Hatia on 24/03/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    @State private var isShowingItemSheet: Bool = false
    @Query(sort: \Expense.date) private var expenses: [Expense]
    @State private var expenseEdit: Expense?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses) { expense in
                    ExpenseCell(expense: expense)
                        .onTapGesture {
                            expenseEdit = expense
                        }
                }
                .onDelete { IndexSet in
                    for index in IndexSet {
                        context.delete(expenses[index])
                    }
                    
                }
            }
            .navigationTitle("Expenses")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $isShowingItemSheet, content: {
                AddExpenseSheet()
            })
            .sheet(item: $expenseEdit) { expense in
                UpdateExpenseSheet(expense: expense)
                
            }
            .toolbar {
                if !expenses.isEmpty {
                    Button("Add expense", systemImage: "plus") {
                        isShowingItemSheet = true
                    }
                }
            }
            .overlay {
                if expenses.isEmpty {
                    ContentUnavailableView(label: {
                        Label("No Expenses", systemImage: "list.bullet.rectangle.portrait")
                    }, description: {
                        Text("Start Adding your expenses to see you list")
                    }, actions: {
                        Button("Add Expense") { isShowingItemSheet = true }
                    })
                    .offset(y: -60)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
