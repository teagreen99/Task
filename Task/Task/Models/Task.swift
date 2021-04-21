//
//  Task.swift
//  Task
//
//  Created by Tim Green on 4/21/21.
//

import Foundation

class Task {
    
    let name: String
    let notes: String?
    let dueDate: Date?
    var isComplete: Bool
    
    init(name: String, notes: String?, dueDate: Date?, isComplete: Bool) {
        
        self.name = name
        self.notes = notes
        self.dueDate = dueDate
        self.isComplete = isComplete
        
        
    }
}// End of class
