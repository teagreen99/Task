//
//  TaskDetailViewController.swift
//  TaskProject
//
//  Created by Tim Green on 6/13/21.
//

import UIKit

class TaskDetailViewController: UIViewController {

    // MARK: - Properties
    var task: Task?
    var date: Date?
    
    // MARK: - IBOutlets
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNotesTextField: UITextView!
    @IBOutlet weak var taskDueDatePicker: UIDatePicker!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - IBActions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = taskNameTextField.text, !name.isEmpty else {return}
        if let task = task {
            TaskController.sharedInstance.update(task: task, name: name, notes: taskNotesTextField.text, dueDate: date)
        } else {
            TaskController.sharedInstance.createTaskWith(name: name, notes: taskNotesTextField.text, dueDate: date)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dueDatePickerChanged(_ sender: Any) {
        self.date = taskDueDatePicker.date
    }
    
    // MARK: - Functions
    func updateViews() {
        guard let task = task else {return}
        taskNameTextField.text = task.name
        taskNotesTextField.text = task.notes
        taskDueDatePicker.date = task.dueDate ?? Date()        
    }
}
