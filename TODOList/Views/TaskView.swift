//
//  TaskView.swift
//  TODOList
//
//  Created by Mickael Mas on 21/02/2020.
//  Copyright © 2020 APPIWEDIA. All rights reserved.
//

import SwiftUI

struct TaskView: View {
    
    @State var task: Task
    var model: TaskModel
    
    var body: some View {
        HStack {
            Text(task.name)
                
            Spacer()

            if task.selected {
                Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.blue)
                .font(.headline)
            } else {
                Image(systemName: "checkmark.circle")

            }
            
        }.onTapGesture {
            self.updateModel(for: self.task)
            self.task.selected.toggle()
        }
    }
    
    fileprivate func updateModel(for selectedTask: Task) {
        let selectedTask = self.model.tasks.filter { (task) -> Bool in
            return task.id == selectedTask.id
        }.first
        
        
        if let selectedTask = selectedTask {
            
            if let index = self.model.tasks.firstIndex(of: selectedTask) {
                self.model.tasks.remove(at: index)
                self.model.tasks.insert(selectedTask, at: index)
                self.model.tasks[index].selected.toggle()
            }
            
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(task: Task(name: "Ma tâche"), model: TaskModel())
        .padding()
    }
}
