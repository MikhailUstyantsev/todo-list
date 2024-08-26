//
//  TodoListPresenter.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 25.08.2024.
//  
//

import UIKit

class TodoListPresenter: ViewToPresenterTodoListProtocol {

    // MARK: Properties
    var view: PresenterToViewTodoListProtocol?
    var interactor: PresenterToInteractorTodoListProtocol?
    var router: PresenterToRouterTodoListProtocol?
    
    
    func startFetchingTodoList() {
        interactor?.getTasks()
    }
    
    
    
    func showTodoListController(navigationController: UINavigationController) {
            router?.pushToTodoListScreen(navigationConroller: navigationController)
    }
        
    
    func showAddNewTaskControllerFrom(viewController: TodoListViewController) {
        router?.presentAddTaskScreen(fromViewController: viewController)
    }
}

extension TodoListPresenter: InteractorToPresenterTodoListProtocol {
    
    
    func todoListFetchedSuccess(todoListModelArray: [Todo]) {
        view?.showTodoList(todoArray: todoListModelArray)
    }
    
    
    func todoListFetchFailed() {
         view?.showError()
    }
    
    
}
