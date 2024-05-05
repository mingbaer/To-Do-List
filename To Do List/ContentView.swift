//
//  ContentView.swift
//  To Do List
//
//  Created by Alexandra Baer Chan on 5/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showNewTask = false
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
        }
        if showNewTask {
            NewToDoView()
        }
    }
}

#Preview {
    ContentView()
}
