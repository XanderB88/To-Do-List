//
//  TasksViewModelProtocol.swift
//  To Do List
//
//  Created by Alexander on 22.10.2021.
//

import Foundation

protocol TasksViewModelProtocol {
    
    var tasks: [Task] { get set }
    
    func numberOfRows() -> Int
    
    func getTasks() -> ()
    
    func saveTask(withTitle title: String) -> ()
  
    func deleteTask(forIndexPath indexPath: IndexPath) -> ()
    
}
