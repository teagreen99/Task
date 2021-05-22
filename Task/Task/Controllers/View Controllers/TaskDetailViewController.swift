//
//  TaskDetailViewController.swift
//  Task
//
//  Created by Tim Green on 4/21/21.
//

import UIKit

class TaskDetailViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBOutlet weak var taskDueDatePicker: UIDatePicker!
    
    
    // MARK: - IBActions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
    @IBAction func dueDatePickerChanged(_ sender: Any) {
    }
    
    // MARK: - Properties
    var task: Task?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
