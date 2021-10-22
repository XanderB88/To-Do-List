//
//  TasksTableViewController.swift
//  To Do List
//
//  Created by Alexander on 22.10.2021.
//

import UIKit

class TasksTableViewController: UITableViewController {
    
    // MARK: - Propertise
    
    var viewModel: TasksViewModelProtocol?
    var newTask: Task?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel  = TasksViewModel()
    }
    
    // MARK: - Table view data source
    
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
        
        cell.textLabel?.text = viewModel.tasks[indexPath.row].title
        
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
            // Delete the row from the data source
            viewModel?.tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    //    Add a moving ability for table rows
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    // MARK: - IBActions
    
    @IBAction func addNewTask(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "New Task", message: "Please add a new task", preferredStyle: .alert)
        
        alertController.addTextField()
        
        let addNewTaskAction = UIAlertAction(title: "Add", style: .default) { action in
            let textField = alertController.textFields?.first
            
            guard let newTaskTitle = textField?.text else { return }
            
            self.newTask = Task(title: newTaskTitle)
            
            self.viewModel?.tasks.append(self.newTask!)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(addNewTaskAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
}
