//
//  TodoListPresenter.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 25.08.2024.
//  
//

import UIKit

class TodoListPresenter: ViewToPresenterTodoListProtocol {
    
    var todoArray: [Todo] = [] 

    // MARK: Properties
    var view: PresenterToViewTodoListProtocol?
    var interactor: PresenterToInteractorTodoListProtocol?
    var router: PresenterToRouterTodoListProtocol?
    
    
    func startFetchingTodoList() {
        interactor?.getTasks()
    }
    
    
    func updatePersistense() {
        interactor?.persistentManager.saveTasks(todoList: todoArray)
    }
    
    
    func showTodoListController(navigationController: UINavigationController) {
        router?.pushToTodoListScreen(navigationConroller: navigationController)
    }
        
    
    func showAddNewTaskControllerFrom(viewController: TodoListViewController) {
        router?.presentAddTaskScreen(fromViewController: viewController)
    }
}

extension TodoListPresenter: InteractorToPresenterTodoListProtocol {
    
    
    func showLoader() {
        view?.playLoader()
    }
    
    
    func hideLoader() {
        view?.stopLoader()
    }
        
    
    func todoListFetchedSuccess(todoListModelArray: [Todo]) {
        todoArray = todoListModelArray
        view?.showTodoList(todoArray: todoListModelArray)
    }
    
    
    func todoListFetchFailed() {
         view?.showError()
    }
    
    
}
