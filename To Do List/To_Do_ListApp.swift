//
//  To_Do_ListApp.swift
//  To Do List
//
//  Created by Alexandra Baer Chan on 5/5/24.
//

import SwiftUI
import SwiftData

@main
struct To_Do_ListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ToDoItem.self)
        }
    }
}
