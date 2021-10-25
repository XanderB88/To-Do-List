//
//  TasksViewModel.swift
//  To Do List
//
//  Created by Alexander on 22.10.2021.
//

import Foundation

class TasksViewModel: TasksViewModelProtocol {
    
    
    var tasks: [Task] = []
    var storageManager = StorageManager()
    
    func numberOfRows() -> Int {
        return tasks.count
    }
    
    func getTasks() {
        storageManager.getData { [weak self] tasks in
            self?.tasks = tasks
        }
    }
    
    func saveTask(withTitle title: String) {
        storageManager.saveData { newTask in
            newTask.title = title
            tasks.append(newTask)
        }
    }
    
}
