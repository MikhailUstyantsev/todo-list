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
        viewController.presenter?.interactor = TodoListInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    
    func pushToTodoListScreen(navigationConroller: UINavigationController) {
        // - TODO: ???
    }
    
    
    func presentAddTaskScreen(fromViewController: TodoListViewController) {
//        let router: PresenterToRouterAddTaskProtocol = AddTaskRouter()
//        router.presentToAddTaskScreen(fromViewController: fromViewController)
    }
    
}
