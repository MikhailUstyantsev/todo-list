//
//  AddTaskPresenter.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 27.08.2024.
//  
//

import Foundation

class AddTaskPresenter: ViewToPresenterAddTaskProtocol {
    
    var todoListView: PresenterToViewTodoListProtocol?
    

    // MARK: Properties
    var view: PresenterToViewAddTaskProtocol?
    var interactor: PresenterToInteractorAddTaskProtocol?
    var router: PresenterToRouterAddTaskProtocol?
    
    
    func addTaskClicked(with title: String) {
           interactor?.addNewTask(withTitle: title)
       }
       
    func cancelTaskClicked() {
        router?.closeAddTaskScreen()
    }
}

extension AddTaskPresenter: InteractorToPresenterAddTaskProtocol {
    
    func addNewTaskSuccess() {
        router?.closeAddTaskScreen()
        todoListView?.refreshList()
    }
    
    func addNewTaskFailed(message: String) {
        
    }
    
    
}
