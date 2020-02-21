//
//  TaskViewModel.swift
//  TODOList
//
//  Created by Mickael Mas on 21/02/2020.
//  Copyright © 2020 APPIWEDIA. All rights reserved.
//

import Foundation

class TaskModel: ObservableObject {
    
    @Published var tasks: [Task] = loadTask()
    
    static func loadTask() -> [Task] {
        return [
        Task(name: "Mettre a jour mon application"),
        Task(name: "Créer mon compte Firebase"),
        Task(name: "Faire le design")
        ]
    }
}
