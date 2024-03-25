//
//  Expense.swift
//  SwiftDataExample
//
//  Created by Ashraf Hatia on 24/03/24.
//

import Foundation
import SwiftData

@Model
class Expense {
    var name: String
    var date: Date
    var amount: Double
    
    init(name: String, date: Date, amount: Double) {
        self.name = name
        self.date = date
        self.amount = amount
    }
}
