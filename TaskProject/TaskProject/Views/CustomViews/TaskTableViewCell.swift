//
//  TaskTableViewCell.swift
//  TaskProject
//
//  Created by Tim Green on 6/14/21.
//

import UIKit

protocol TaskCompletionDelegate: AnyObject {
    func taskCellButtonTapped(_ sender: TaskTableViewCell)
}

class TaskTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    weak var delegate: TaskCompletionDelegate?
    
    // MARK: - IBOutlets
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var completionButton: UIButton!
    
    
    // MARK: - IBActions
    @IBAction func completionButtonTapped(_ sender: Any) {
        if let delegate = delegate {
            delegate.taskCellButtonTapped(self)
        }
    }
    
    // MARK: - Functions
    func updateViews() {
        guard let task = task else {return}
        taskNameLabel.text = task.name
        if task.isComplete {
            completionButton.setBackgroundImage(UIImage(systemName: "checkmark.square"), for: .normal)
        } else {
            completionButton.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        }
    }
}
