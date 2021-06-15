//
//  TaskListTableViewController.swift
//  TaskProject
//
//  Created by Tim Green on 6/13/21.
//

import UIKit

class TaskListTableViewController: UITableViewController {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        TaskController.sharedInstance.loadFromPersistenceStore()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskController.sharedInstance.tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? TaskTableViewCell else {
            return UITableViewCell()
        }
        
        let task = TaskController.sharedInstance.tasks[indexPath.row]
        
        cell.delegate = self
        cell.task = task
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let taskToDelete = TaskController.sharedInstance.tasks[indexPath.row]
            TaskController.sharedInstance.delete(task: taskToDelete)
                tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let destinationVC = segue.destination as? TaskDetailViewController else {return}
            let task = TaskController.sharedInstance.tasks[indexPath.row]
            destinationVC.task = task
        }
    }
}

extension TaskListTableViewController: TaskCompletionDelegate {
    func taskCellButtonTapped(_ sender: TaskTableViewCell) {
        guard let task = sender.task else {return}
        TaskController.sharedInstance.toggleIsComplete(task: task)
        sender.updateViews()
    }
}
