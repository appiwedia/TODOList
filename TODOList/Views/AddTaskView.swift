//
//  AddTaskView.swift
//  TODOList
//
//  Created by Mickael Mas on 20/02/2020.
//  Copyright © 2020 APPIWEDIA. All rights reserved.
//

import SwiftUI

struct AddTaskView: View {
    
    @State private var message = ""
    var model: TaskModel
    @Binding var isAddScreenDisplayed: Bool

    var body: some View {
                
        NavigationView {
            VStack {
                TextField("Je dois créer une tâche...", text: $message)
                .padding()
                .navigationBarTitle(Text("Nouvelle tâche"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    
                    if !self.message.isEmpty {
                        let task = Task(name: self.message)
                        self.model.tasks.append(task)
                        self.isAddScreenDisplayed = false
                    }
                    
                }, label: {
                    Text("Ajouter")
                }))
                Spacer()
            }
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(model: TaskModel(), isAddScreenDisplayed: .constant(true))
    }
}
