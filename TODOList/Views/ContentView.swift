//
//  ContentView.swift
//  TODOList
//
//  Created by Mickael Mas on 19/02/2020.
//  Copyright © 2020 APPIWEDIA. All rights reserved.
//

import SwiftUI

struct ContentView: View {
        
    @ObservedObject private var model = TaskModel()
    @State private var isAddScreenDisplayed = false
    
    var countCompletTasks: Int {
        
        return self.model.tasks.filter { $0.selected }.count
    }
    
    var body: some View {

        NavigationView {
            VStack {
                Text("Tâches terminées : \(self.countCompletTasks)")
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.center)
                    .padding()
                
                List {
                    ForEach(self.model.tasks) { task in
                        TaskView(task: task, model: self.model)
                    }.onDelete(perform: delete)
                }
            }
            .navigationBarTitle("Liste des tâches", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.isAddScreenDisplayed.toggle()
            }, label: {
                Image(systemName: "plus")
                    .font(.headline)
            }))
        }.sheet(isPresented: $isAddScreenDisplayed) {
            AddTaskView(model: self.model, isAddScreenDisplayed: self.$isAddScreenDisplayed)
        }
    }
    
    func delete(at offsets: IndexSet) {
        model.tasks.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
