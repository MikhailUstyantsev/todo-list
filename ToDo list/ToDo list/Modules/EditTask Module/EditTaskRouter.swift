//
//  EditTaskRouter.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 29.08.2024.
//
//

import Foundation
import UIKit

class EditTaskRouter: PresenterToRouterEditTaskProtocol {
    
    static var view: EditTaskViewController?
    static var todoListView: PresenterToViewTodoListProtocol?
    
    // MARK: Static methods
    static func createModule(task: Todo) -> EditTaskViewController {
        
        let viewController = EditTaskViewController(task: task)
        
        let presenter: ViewToPresenterEditTaskProtocol & InteractorToPresenterEditTaskProtocol & EditTodoEventHandler = EditTaskPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = EditTaskRouter()
        viewController.presenter?.view = viewController
        viewController.output = presenter
        let persistenceManager = PersistenceManager()
        viewController.presenter?.interactor = EditTaskInteractor(persistentManager: persistenceManager)
        viewController.presenter?.interactor?.presenter = presenter
        
//        viewController.modalPresentationStyle = .overCurrentContext
        return viewController
    }
    
    
    
    func presentToEditTaskScreen(fromViewController: TodoListViewController, item: Todo) {
        EditTaskRouter.todoListView = fromViewController.presenter?.view
        let viewToPresent = EditTaskRouter.createModule(task: item)
        viewToPresent.presenter?.todoListView = fromViewController.presenter?.view
        let navigationViewController = UINavigationController(rootViewController: viewToPresent)
        EditTaskRouter.view = viewToPresent
        fromViewController.present(navigationViewController, animated: true)
    }
    
    
    func closeEditTaskScreen() {
        EditTaskRouter.view?.dismiss(animated: true, completion: nil)
    }
}
