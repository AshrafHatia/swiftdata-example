//
//  AddExpenseSheet.swift
//  SwiftDataExample
//
//  Created by Ashraf Hatia on 25/03/24.
//

import SwiftUI
import SwiftData

struct AddExpenseSheet: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var date: Date = .now
    @State private var amount: Double = 0
    
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2024, month: 1, day: 1)
        let endComponents = DateComponents(year: 2024, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
        ...
        calendar.date(from:endComponents)!
    }()
    
    var body: some View {
        NavigationStack{
            Form {
                TextField("Expense name",text: $name)
                DatePicker("Date", selection: $date,in: dateRange,displayedComponents: .date)
                TextField("amount", value: $amount,format: .currency(code: "INR"))
                    .keyboardType(/*@START_MENU_TOKEN@*/.decimalPad/*@END_MENU_TOKEN@*/)
            }
            .navigationTitle("New Expense")
            .toolbarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .cancellationAction){
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItemGroup(placement: .confirmationAction){
                    Button("Save") {
                        saveData(name: name, date: date, amount: amount)
                    }
                }
            }
        }
    }
    
    func saveData(name: String, date: Date, amount: Double) {
        context.insert(Expense(name: name, date: date, amount: amount))
        
        dismiss()
        // save manually 
        //        do {
        //            context.insert(Expense(name: name, date: date, amount: amount))
        //
        //            //try context.save()
        //            dismiss()
        //        } catch {
        //            print("DEBUG : Failed to save data \(error.localizedDescription)")
        //
        //        }
    }
}



#Preview {
    AddExpenseSheet()
}
