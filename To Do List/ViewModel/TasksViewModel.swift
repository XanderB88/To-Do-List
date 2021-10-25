//
//  TasksViewModel.swift
//  To Do List
//
//  Created by Alexander on 22.10.2021.
//

import Foundation

class TasksViewModel: TasksViewModelProtocol {
    
    var storageManager = StorageManager()
    var tasks: [Task] = []
    
    func numberOfRows() -> Int {
        return tasks.count
    }
    
    func titleForCell(forIndexPath indexPath: IndexPath) -> String {
        return tasks[indexPath.row].title ?? "Do not have title"
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
    
    func deleteTask(forIndexPath indexPath: IndexPath) {
        storageManager.deleteData(indexPath)
        tasks.remove(at: indexPath.row)
    }
    
    
    
}
