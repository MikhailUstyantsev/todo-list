//
//  EditTaskPresenter.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 29.08.2024.
//
//

import Foundation

class EditTaskPresenter: ViewToPresenterEditTaskProtocol, EditTodoEventHandler {
    
    // MARK: Properties
    weak var todoListView: PresenterToViewTodoListProtocol?
    weak var view: PresenterToViewEditTaskProtocol?
    var interactor: PresenterToInteractorEditTaskProtocol?
    var router: PresenterToRouterEditTaskProtocol?
    
    
    func editTaskFinished(newText: String, oldText: String) {
        interactor?.updateTask(newTitle: newText, oldTitle: oldText)
    }
    
    
    func cancelEditTaskClicked() {
        router?.closeEditTaskScreen()
    }
}

extension EditTaskPresenter: InteractorToPresenterEditTaskProtocol {
    
    func editTaskSuccess() {
        view?.editTaskSuccess()
        afterDelay(1.5) { [weak self] in
            self?.router?.closeEditTaskScreen()
            self?.todoListView?.refreshList()
        }
    }
    
    
    func editTaskFailed(message: String) {
        
    }
    
    
}
