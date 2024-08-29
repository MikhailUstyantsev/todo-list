//
//  TodoListContract.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 25.08.2024.
//  
//

import UIKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewTodoListProtocol: AnyObject {
    func refreshList()
    func showTodoList(todoArray: [Todo])
    func showError()
    func playLoader()
    func stopLoader()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterTodoListProtocol {
    
    var view: PresenterToViewTodoListProtocol? { get set }
    var interactor: PresenterToInteractorTodoListProtocol? { get set }
    var router: PresenterToRouterTodoListProtocol? { get set }
    func startFetchingTodoList()
    func updatePersistense()
    var todoArray: [Todo] { get set }
    
    func showEditTaskController(viewController: TodoListViewController, item: Todo)
    func showAddNewTaskControllerFrom(viewController: TodoListViewController)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorTodoListProtocol {
    
    var presenter: InteractorToPresenterTodoListProtocol? { get set }
    var persistentManager: PersistenceManager { get set }
    func getTasks()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterTodoListProtocol {
    func todoListFetchedSuccess(todoListModelArray: [Todo])
    func todoListFetchFailed()
    func showLoader()
    func hideLoader()
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterTodoListProtocol {
    static func createModule() -> TodoListViewController
    func presentEditTaskScreen(fromViewController: TodoListViewController, item: Todo)
    func presentAddTaskScreen(fromViewController: TodoListViewController)
}
