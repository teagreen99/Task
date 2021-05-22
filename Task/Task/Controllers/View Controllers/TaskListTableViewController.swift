//
//  TaskListTableViewController.swift
//  Task
//
//  Created by Tim Green on 4/21/21.
//

import UIKit

class TaskListTableViewController: UITableViewController {
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskController.sharedInstance.tasks.count
    } // End of function
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        
        let task = TaskController.sharedInstance.tasks[indexPath.row]
        
        cell.textLabel?.text = task.name
        
        return cell
    } // End of function
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let taskToDelete = TaskController.sharedInstance.tasks[indexPath.row]
            TaskController.sharedInstance.deleteTask(task: taskToDelete)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    } // End of function
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            
            guard let index = tableView.indexPathForSelectedRow,
                  let destinationVC = segue.destination as? TaskDetailViewController else {return}
            
            let task = TaskController.sharedInstance.tasks[index.row]
            destinationVC.task = task
        }
    } // End of function
} // End of class
