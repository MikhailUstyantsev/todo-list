//
//  EditTaskContract.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 29.08.2024.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewEditTaskProtocol: AnyObject {
    func editTaskSuccess()
    func editTaskFailed(message: String)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterEditTaskProtocol: AnyObject {
    var todoListView: PresenterToViewTodoListProtocol? { get set }
    
    var view: PresenterToViewEditTaskProtocol? { get set }
    var interactor: PresenterToInteractorEditTaskProtocol? { get set }
    var router: PresenterToRouterEditTaskProtocol? { get set }
}


protocol EditTodoEventHandler: AnyObject {
    func editTaskFinished(newText: String, oldText: String)
    func cancelEditTaskClicked()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorEditTaskProtocol: AnyObject {
    
    var presenter: InteractorToPresenterEditTaskProtocol? { get set }
    var persistentManager: PersistenceManager { get set }
    func updateTask(newTitle: String, oldTitle: String)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterEditTaskProtocol: AnyObject {
    func editTaskSuccess()
    func editTaskFailed(message: String)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterEditTaskProtocol: AnyObject {
    static func createModule(task: Todo) -> EditTaskViewController
    func presentToEditTaskScreen(fromViewController: TodoListViewController, item: Todo)
    func closeEditTaskScreen()
}
