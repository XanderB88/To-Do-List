//
//  TasksViewModel.swift
//  To Do List
//
//  Created by Alexander on 22.10.2021.
//

import Foundation

class TasksViewModel: TasksViewModelProtocol {

    var tasks: [Task] = [
        Task(title: "By something"),
        Task(title: "Do something"),
        Task(title: "Read something"),
        Task(title: "Sleep"),
    ]
    
    func numberOfRows() -> Int {
        return tasks.count
    }
    
}
