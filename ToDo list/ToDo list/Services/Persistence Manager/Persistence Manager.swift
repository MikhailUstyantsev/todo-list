//
//  Persistence Manager.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 25.08.2024.
//

import Foundation
import CoreData


final class PersistenceManager {
    
    private let coreDataStack = CoreDataStack(modelName: "ToDoList")
    
    
    func getExistingTasks() -> [Goal] {
        let fetchRequest: NSFetchRequest<Goal> = Goal.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: #keyPath(Goal.text), ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        do {
            let existingTasks = try coreDataStack.managedContext.fetch(fetchRequest)
            return existingTasks
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        return []
    }
    
    
    func addNewTask(newTask: Todo) {
        // - TODO: Refactor to deal with Goal entities
//        var todoList = self.getExistingTasks()
//        todoList.append(newTask)
//        
//        saveTasks(todoList: todoList)
    }
    
    
    func saveTasks(todoList: [Todo]) {
        /// clean storage in order to avoid duplications
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Goal")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try coreDataStack.storeContainer.persistentStoreCoordinator.execute(deleteRequest, with: coreDataStack.managedContext)
        } catch let error as NSError {
            // handle the error if needed
        }
        _ = todoList.map {
            self.createGoalEntityFrom($0)
        }
        coreDataStack.saveContext()
    }
    
    
    private func createGoalEntityFrom(_ item: Todo) -> NSManagedObject? {
        let context = coreDataStack.managedContext
        if let goal = NSEntityDescription.insertNewObject(forEntityName: "Goal", into: context) as? Goal {
            goal.completed = item.completed
            goal.text = item.todo
            goal.id = UUID()
            return goal
        }
        return nil
    }
    
    
}
