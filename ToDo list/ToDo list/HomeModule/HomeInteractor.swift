//
//  HomeInteractor.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 23.08.2024.
//  
//

import Foundation

class HomeInteractor: PresenterToInteractorHomeProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterHomeProtocol?
    
    func getTasks() {
//        let taskList = PersistenceManager.getExistingTasks()
//        
//        if taskList.count == 0 {
//           //MARK: - FETCH DATA FROM URL
//            guard let url = URL(string: Constants.API.todosApiString) else {
//                return
//            }
//            
//            Task {
//                let tasks = try? await NetworkManager.shared.retrieveTasks(from: url)
//                guard let tasks else { return }
//                presenter?.todoListFetchedSuccess(todoListModelArray: tasks.todos)
//                PersistenceManager.saveTasks(todoList: tasks.todos)
//            }
//        } else if taskList.count > 0 {
//            self.presenter?.todoListFetchedSuccess(todoListModelArray: taskList)
//        } else {
//            self.presenter?.todoListFetchFailed()
//        }
//        
    }
    
}

