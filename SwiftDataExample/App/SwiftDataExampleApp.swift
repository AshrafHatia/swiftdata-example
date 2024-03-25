//
//  SwiftDataExampleApp.swift
//  SwiftDataExample
//
//  Created by Ashraf Hatia on 24/03/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataExampleApp: App {
    let container: ModelContainer = {
        let schema = Schema([Expense.self]) 
        let container = try! ModelContainer.init(for: schema, configurations: [])
        
        return container
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
}
