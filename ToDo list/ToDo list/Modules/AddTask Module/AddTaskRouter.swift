//
//  AddTaskRouter.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 27.08.2024.
//  
//

import Foundation
import UIKit

final class AddTaskRouter: PresenterToRouterAddTaskProtocol {
    
    static var view: AddTaskViewController?
    static var todoListView: PresenterToViewTodoListProtocol?
    
    // MARK: Static methods
    static func createModule() -> AddTaskViewController {
        
        let viewController = AddTaskViewController()
        
        let presenter: ViewToPresenterAddTaskProtocol & InteractorToPresenterAddTaskProtocol & AddTodoEventHandler = AddTaskPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = AddTaskRouter()
        viewController.presenter?.view = viewController
        viewController.output = presenter
        let persistenceManager = PersistenceManager()
        viewController.presenter?.interactor = AddTaskInteractor(persistentManager: persistenceManager)
        viewController.presenter?.interactor?.presenter = presenter
        
//        viewController.modalPresentationStyle = .overCurrentContext
        return viewController
    }
    
    
    func presentToAddTaskScreen(fromViewController: TodoListViewController) {
        AddTaskRouter.todoListView = fromViewController.presenter?.view
        let viewToPresent = AddTaskRouter.createModule()
        viewToPresent.presenter?.todoListView = fromViewController.presenter?.view
        let navigationViewController = UINavigationController(rootViewController: viewToPresent)
        AddTaskRouter.view = viewToPresent
        fromViewController.present(navigationViewController, animated: true)
    }
    
    
    func closeAddTaskScreen() {
        AddTaskRouter.view?.dismiss(animated: true, completion: nil)
    }
    
    
}
