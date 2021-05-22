//
//  Task.swift
//  Task
//
//  Created by Tim Green on 4/21/21.
//

import Foundation

class Task: Codable {
    
    var name: String
    var notes: String?
    var dueDate: Date?
    var isComplete: Bool
    let uuid: String
    
    init(name: String, notes: String?, dueDate: Date?, isComplete: Bool = false, uuid: String = UUID().uuidString) {
        
        self.name = name
        self.notes = notes
        self.dueDate = dueDate
        self.isComplete = isComplete
        self.uuid = uuid
        
    }
}// End of class

extension Task: Equatable {
    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
