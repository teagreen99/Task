//
//  TaskController.swift
//  Task
//
//  Created by Tim Green on 4/21/21.
//

import Foundation

class TaskController {
    
    static let sharedInstance = TaskController()
   
    // Source of Truth
    var tasks: [Task] = []
    
    // MARK: - CRUD Functions
    // Ctreate, Read, Update, Delete
    func createTask(name: String, notes: String?, dueDate: Date?) {
        let newTask = Task(name: name, notes: notes, dueDate: dueDate, isComplete: false)
        
        tasks.append(newTask)
    
        saveToPersistenceStore()
    } // End of function

    func updateTask(task: Task, name: String, notes: String?, dueDate: Date?) {
        task.name = name
        task.notes = notes
        task.dueDate = dueDate

        saveToPersistenceStore()
    } // End of function

    func toggleIsComplete(task: Task) {
        task.isComplete = !task.isComplete
        
        saveToPersistenceStore()
    } // End of function
    
    func deleteTask(task: Task) {
        guard let index = tasks.firstIndex(of: task) else {return}
        tasks.remove(at: index)
        
        saveToPersistenceStore()
    } // End of function
    
    //MARK: -  persistence
    func createPersistenceStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("Tasks.json")
        return fileURL
    } // End of function
    
    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(tasks)
            try data.write(to: createPersistenceStore())
        } catch {
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
    } // End of function
    
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: createPersistenceStore())
            tasks = try JSONDecoder().decode([Task].self, from: data)
        } catch {
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
    } // End of function
}// End of class

// MARK: - Extensions


