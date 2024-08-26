//
//  TodoListInteractor.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 25.08.2024.
//  
//

import Foundation

class TodoListInteractor: PresenterToInteractorTodoListProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterTodoListProtocol?
    var persistentManager: PersistenceManager
    
    init(persistentManager: PersistenceManager) {
        self.persistentManager = persistentManager
    }
    
    func getTasks() {
        let taskList = persistentManager.getExistingTasks()
        let todosArray = taskList.map { createTodoItemFrom($0) }
        
        if taskList.count == 0 {
            
            guard let url = URL(string: Constants.API.todosApiString) else {
                return
            }

            Task {
                let tasks = try? await NetworkManager.shared.retrieveTasks(from: url)
                guard let tasks else { return }
                presenter?.todoListFetchedSuccess(todoListModelArray: tasks.todos)
                persistentManager.saveTasks(todoList: tasks.todos)
            }
            
        } else if taskList.count > 0 {
            self.presenter?.todoListFetchedSuccess(todoListModelArray: todosArray)
        } else {
            self.presenter?.todoListFetchFailed()
        }
    }
    
    
    private func createTodoItemFrom(_ entity: Goal) -> Todo {
        
        let todo = Todo(
            id: entity.id?.hashValue,
            todo: entity.text ?? "unknown",
            completed: entity.completed,
            userID: entity.id?.hashValue
        )
            return todo
    }
}
