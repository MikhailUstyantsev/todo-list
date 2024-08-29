//
//  TodoListRouter.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 25.08.2024.
//  
//

import Foundation
import UIKit

class TodoListRouter: PresenterToRouterTodoListProtocol {
    
    
    // MARK: Static methods
    static func createModule() -> TodoListViewController {
        
        let viewController = TodoListViewController()
        
        let presenter: ViewToPresenterTodoListProtocol & InteractorToPresenterTodoListProtocol = TodoListPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = TodoListRouter()
        viewController.presenter?.view = viewController
        let persistenceManager = PersistenceManager()
        viewController.presenter?.interactor = TodoListInteractor(persistentManager: persistenceManager)
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    
    func presentEditTaskScreen(fromViewController: TodoListViewController, item: Todo) {
        let router: PresenterToRouterEditTaskProtocol = EditTaskRouter()
        router.presentToEditTaskScreen(fromViewController: fromViewController, item: item)
    }
    
    
    func presentAddTaskScreen(fromViewController: TodoListViewController) {
        let router: PresenterToRouterAddTaskProtocol = AddTaskRouter()
        router.presentToAddTaskScreen(fromViewController: fromViewController)
    }
    
}
