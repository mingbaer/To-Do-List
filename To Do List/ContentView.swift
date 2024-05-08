//
//  ContentView.swift
//  To Do List
//
//  Created by Alexandra Baer Chan on 5/5/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var showNewTask = false
    
    @Query var toDos: [ToDoItem]
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack {
            HStack {
                Text("To Do List:")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .font(.custom("AmericanTypewriter", fixedSize: 36))
                Spacer()
                Button {
                    withAnimation {
                        self.showNewTask = true
                    }
                } label: {
                    Text("+ ")
                } .fontWeight(.black)
                    .font(.custom("AmericanTypewriter", fixedSize: 36))
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
            }
            .padding()
            Spacer()
            List {
                ForEach(toDos) { toDoItem in
                    if toDoItem.isImportant == true {
                        Text("‼️" + toDoItem.title)
                    } else {
                        Text(toDoItem.title)
                    }
                }
                .onDelete(perform: deleteToDo)
            }
            .listStyle(.plain)
        }
        if showNewTask {
            NewToDoView(showNewTask: $showNewTask, toDoItem: ToDoItem(title: "", isImportant:false))
        }
        
    }
    
    func deleteToDo(at offsets: IndexSet) {
        for offset in offsets {
            let toDoItem = toDos[offset]
            modelContext.delete(toDoItem)
        }
    }
}

#Preview {
    ContentView()
}
