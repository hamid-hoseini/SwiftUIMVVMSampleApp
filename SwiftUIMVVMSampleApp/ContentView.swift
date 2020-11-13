//
//  ContentView.swift
//  SwiftUIMVVMSampleApp
//
//  Created by Hamid Hoseini on 11/12/20.
//

import SwiftUI

struct ToDoListItem: Identifiable {
    var id = UUID()
    var action: String
}

class ToDoList: ObservableObject {
    @Published var items: [ToDoListItem] = []
}

struct ContentView: View {
    @ObservedObject var viewModel: ToDoList = ToDoList()
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.items) { item in
                    Text(item.action)
                }
            }
            .navigationTitle("To Do List")
            .navigationBarItems(trailing: Button(action: {
                
                self.viewModel.items = [
                    ToDoListItem(action: "Go Running"),
                    ToDoListItem(action: "Get Milk"),
                    ToDoListItem(action: "Do Work"),
                    ToDoListItem(action: "Upload Video"),
                    ToDoListItem(action: "Teach SwiftUI")
                ]
                
            }, label: {
                Text("Refresh")
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
