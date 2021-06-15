//
//  TaskController.swift
//  TaskProject
//
//  Created by Tim Green on 6/13/21.
//

import Foundation

class TaskController {
    
    static let sharedInstance = TaskController()
    var tasks: [Task] = []
    
    // MARK: - Functions
    func createTaskWith(name: String, notes: String?, dueDate: Date?) {
        let newTask = Task(name: name, notes: notes, dueDate: dueDate ?? Date())
        tasks.append(newTask)
        saveToPersistenceStore()
    } // End of function
    
    func update(task: Task, name: String, notes: String?, dueDate: Date?) {
        task.name = name
        task.notes = notes
        task.dueDate = dueDate
        saveToPersistenceStore()
    } // End of function
    
    func toggleIsComplete(task: Task) {
        task.isComplete.toggle()
        saveToPersistenceStore()
    } // End of function
    
    func delete(task: Task) {
        guard let index = tasks.firstIndex(of: task) else {return}
        tasks.remove(at: index)
        saveToPersistenceStore()
    } // End of function
    
    // MARK: - Persistence
    func createPersistenceStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("Task.json")
        return fileURL
    }
    
    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(tasks)
            try data.write(to: createPersistenceStore())
        } catch {
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
    } // End of PersistenceStore function
    
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: createPersistenceStore())
            tasks = try JSONDecoder().decode([Task].self, from: data)
        } catch {
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
    }
}
