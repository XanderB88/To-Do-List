//
//  TasksViewModel.swift
//  To Do List
//
//  Created by Alexander on 22.10.2021.
//

import Foundation

class TasksViewModel: TasksViewModelProtocol {

    var tasks: [Task] = []
    
    func numberOfRows() -> Int {
        return tasks.count
    }
    
}
