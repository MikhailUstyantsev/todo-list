//
//  AddTaskContract.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 27.08.2024.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewAddTaskProtocol: AnyObject {
    func showAddTaskSuccess()
    func showAddTaskFailed(message: String)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterAddTaskProtocol: AnyObject {
    var todoListView: PresenterToViewTodoListProtocol? { get set }
    
    var view: PresenterToViewAddTaskProtocol? { get set }
    var interactor: PresenterToInteractorAddTaskProtocol? { get set }
    var router: PresenterToRouterAddTaskProtocol? { get set }
    
}


protocol AddTodoEventHandler: AnyObject {
    func addTaskClicked(with text: String)
    func cancelTaskClicked()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorAddTaskProtocol: AnyObject {
    
    var presenter: InteractorToPresenterAddTaskProtocol? { get set }
    var persistentManager: PersistenceManager { get set }
    func addNewTask(withTitle: String)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterAddTaskProtocol: AnyObject {
    func addNewTaskSuccess()
    func addNewTaskFailed(message: String)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterAddTaskProtocol {
    static func createModule() -> AddTaskViewController
    func presentToAddTaskScreen(fromViewController: TodoListViewController)
    func closeAddTaskScreen()
}
