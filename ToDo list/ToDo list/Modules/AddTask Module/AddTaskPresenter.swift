//
//  AddTaskPresenter.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 27.08.2024.
//  
//

import Foundation

class AddTaskPresenter: ViewToPresenterAddTaskProtocol {
    
    weak var todoListView: PresenterToViewTodoListProtocol?
    

    // MARK: Properties
    weak var view: PresenterToViewAddTaskProtocol?
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
        view?.showAddTaskSuccess()
        afterDelay(1.5) { [weak self] in
            self?.router?.closeAddTaskScreen()
            self?.todoListView?.refreshList()
        }
    }
    
    func addNewTaskFailed(message: String) {
        
    }
    
    
}
