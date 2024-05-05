//
//  NewToDoView.swift
//  To Do List
//
//  Created by Alexandra Baer Chan on 5/5/24.
//

import SwiftUI

struct NewToDoView: View {
    var body: some View {
        VStack (alignment: .leading) {
            Text("Task title:")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
                .multilineTextAlignment(.leading)
            TextField("Enter the task description...", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)          .foregroundColor(Color.black)
            Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                    Text("Is it important?")
                }
            Button {
            } label: {
                Text("Save")
                    .fontWeight(.black)
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)

        }
        .padding()
    }
}

#Preview {
    NewToDoView()
}
