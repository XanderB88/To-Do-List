//
//  StorageManager.swift
//  To Do List
//
//  Created by Alexander on 25.10.2021.
//

import Foundation
import CoreData
import UIKit


class StorageManager {
    
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
   
}
