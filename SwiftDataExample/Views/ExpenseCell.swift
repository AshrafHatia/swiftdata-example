//
//  ExpenseCell.swift
//  SwiftDataExample
//
//  Created by Ashraf Hatia on 25/03/24.
//

import SwiftUI
import SwiftData

struct ExpenseCell: View {
    
    var expense: Expense
    
    init(expense: Expense = Expense(name: "", date: .now, amount: 0.0)) {
        self.expense = expense
    }
    
    var body: some View {
        HStack{
            Text(expense.date, format: .dateTime.month(.abbreviated).day())
                .frame(width: 70, alignment: .leading)
            Text(expense.name)
            Spacer()
            Text(expense.amount, format: .currency(code: "INR"))
        }
    }
}

#Preview {
    ExpenseCell()
}
