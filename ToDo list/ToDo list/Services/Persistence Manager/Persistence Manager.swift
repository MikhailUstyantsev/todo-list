//
//  Persistence Manager.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 25.08.2024.
//

import Foundation


final class PersistenceManager {
    
    private let coreDataStack = CoreDataStack(modelName: "ToDoList")
    
    private init() {}
    
    
    static func getExistingTasks() -> [Todo] {
        //placeholder
        return []
    }
    
    
    static func addNewTask(newTask: Todo) {
        var todoList = self.getExistingTasks()
        todoList.append(newTask)
        
        saveTasks(todoList: todoList)
    }
    
    
    static func saveTasks(todoList: [Todo]) {
        
    }
    
    
    
}
