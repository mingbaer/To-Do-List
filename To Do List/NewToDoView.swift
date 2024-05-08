//
//  NewToDoView.swift
//  To Do List
//
//  Created by Alexandra Baer Chan on 5/5/24.
//

import SwiftUI
import SwiftData

struct NewToDoView: View {
    
    @Binding var showNewTask: Bool
    @Bindable var toDoItem: ToDoItem
    @Environment(\.modelContext) var modelContext

    var body: some View {
        VStack (alignment: .leading) {
            Text("Task title:")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
                .multilineTextAlignment(.leading)
            TextField("Enter the task description...", text: $toDoItem.title, axis: .vertical)
                .foregroundColor(Color.black)
            Toggle(isOn: $toDoItem.isImportant) {
                    Text("Is it important?")
                    .padding()
                }
            Button {
                addToDo()
                self.showNewTask = false
            } label: {
                Text("Save")
                    .fontWeight(.black)
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)

        }
        .padding()
    }
    func addToDo() {
        let toDo = ToDoItem(title: toDoItem.title, isImportant: toDoItem.isImportant)
        modelContext.insert(toDo)
    }
}

#Preview {
   let config = ModelConfiguration(isStoredInMemoryOnly: true)
let container = try! ModelContainer(for: ToDoItem.self, configurations: config)

let toDo = ToDoItem(title: "Example ToDo", isImportant: false)
return NewToDoView(showNewTask: .constant(true), toDoItem: toDo)
    .modelContainer(container)
}
