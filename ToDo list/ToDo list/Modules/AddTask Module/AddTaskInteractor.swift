//
//  AddTaskInteractor.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 27.08.2024.
//  
//

import Foundation

class AddTaskInteractor: PresenterToInteractorAddTaskProtocol {
    
    // MARK: Properties
    weak var presenter: InteractorToPresenterAddTaskProtocol?
    var persistentManager: PersistenceManager
    
    
    init(persistentManager: PersistenceManager) {
        self.persistentManager = persistentManager
    }
    
    
    func addNewTask(withTitle: String) {
        let newTask = Todo(
            id: nil,
            todo: withTitle,
            completed: false,
            userID: nil
        )
        persistentManager.addNewTask(newTask: newTask)
        presenter?.addNewTaskSuccess()
    }
    
    
}
