//
//  TasksTableViewController.swift
//  To Do List
//
//  Created by Alexander on 22.10.2021.
//

import UIKit
import CoreData

class TasksTableViewController: UITableViewController {
    
    // MARK: - Propertise
    
    var viewModel: TasksViewModelProtocol?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel  = TasksViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel?.getTasks()
    }
    
    // MARK: - IBActions
    
    @IBAction func addNewTask(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "New Task", message: "Please add a new task", preferredStyle: .alert)
        
        alertController.addTextField()
        
        let addNewTaskAction = UIAlertAction(title: "Add", style: .default) { action in
            let textField = alertController.textFields?.first
            
            guard let newTaskTitle = textField?.text else { return }
            self.viewModel?.saveTask(withTitle: newTaskTitle)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(addNewTaskAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
    
}

// MARK: - Table view data source
extension TasksTableViewController {
   
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel?.numberOfRows() ?? .zero
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        guard let viewModel = viewModel else { return cell }
        
        let task = viewModel.tasks[indexPath.row]
        cell.textLabel?.text = task.title
        
        return cell
    }

    // MARK: - Table view delegate

    //  Add an editing action for table rows
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel?.deleteTask(forIndexPath: indexPath)
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    //    Add a moving ability for table rows
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
}





