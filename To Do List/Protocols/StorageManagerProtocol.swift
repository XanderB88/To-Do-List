//
//  StorageManagerProtocol.swift
//  To Do List
//
//  Created by Alexander on 25.10.2021.
//

import Foundation
import CoreData

protocol StorageManagerProtocol {
    
    func getContext() -> NSManagedObjectContext
    func getData(completion: (([Task]) -> ())) -> ()
    func saveData(completion: (Task) -> ()) -> ()
    func deleteData(_ indexPath: IndexPath) -> ()
    
}
