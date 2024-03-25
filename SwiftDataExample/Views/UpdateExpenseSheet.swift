//
//  UpdateExpenseSheet.swift
//  SwiftDataExample
//
//  Created by Ashraf Hatia on 25/03/24.
//

import SwiftUI
import SwiftData

struct UpdateExpenseSheet: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @Bindable var expense:Expense
    
    init(expense: Expense = Expense(name: "", date: .now, amount: 0.0)) {
        self.expense = expense
    }
    
    var body: some View {
        NavigationStack{
            Form {
                TextField("Expense Name", text:$expense.name)
                DatePicker("Date", selection: $expense.date, displayedComponents: .date)
                TextField("Ampunt", value: $expense.amount, format: .currency(code: "INR"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Update Expense")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing){
                    Button("Done") { dismiss() }
                }
            }
        }
        
    }
}

#Preview {
    UpdateExpenseSheet()
}
