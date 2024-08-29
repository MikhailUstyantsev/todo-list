//
//  EditTaskPresenter.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 29.08.2024.
//  
//

import Foundation

class EditTaskPresenter: ViewToPresenterEditTaskProtocol, EditTodoEventHandler {
    

    weak var todoListView: PresenterToViewTodoListProtocol?
    
    // MARK: Properties
    weak var view: PresenterToViewEditTaskProtocol?
    var interactor: PresenterToInteractorEditTaskProtocol?
    var router: PresenterToRouterEditTaskProtocol?
    
    
    func editTaskFinished(with text: String) {
        //interactor?.editTask(withTitle: title)
    }
    
    
    func cancelEditTaskClicked() {
        router?.closeEditTaskScreen()
    }
}

extension EditTaskPresenter: InteractorToPresenterEditTaskProtocol {
    
}
