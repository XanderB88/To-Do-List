//
//  TasksViewModelProtocol.swift
//  To Do List
//
//  Created by Alexander on 22.10.2021.
//

import Foundation

protocol TasksViewModelProtocol {
    
    var tasks: [Task] { get }
    
    func numberOfRows() -> Int
    
}
