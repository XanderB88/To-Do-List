//
//  StorageManager.swift
//  To Do List
//
//  Created by Alexander on 25.10.2021.
//

import Foundation
import CoreData
import UIKit


class StorageManager: StorageManagerProtocol {
    
    static let shared = StorageManager()
    
    private init(){}
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func getData(completion: (([Task]) -> ())) {
        let context = getContext()
        
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        do {
            completion(try context.fetch(fetchRequest))
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func saveData(completion: (Task) -> ()) {
        let context = getContext()
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Task", in: context) else { return }
        
        let taskObject = Task(entity: entity, insertInto: context)
        
        completion(taskObject)
        
        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func deleteData(_ indexPath: IndexPath) {
        
        let context = getContext()
        
        let fetchRequest :NSFetchRequest<Task> = Task.fetchRequest()
        
        if let tasks = try? context.fetch(fetchRequest) {
            context.delete(tasks[indexPath.row])
        }
        
        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
}
