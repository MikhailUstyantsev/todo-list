//
//  EditTaskInteractor.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 29.08.2024.
//  
//

import Foundation

class EditTaskInteractor: PresenterToInteractorEditTaskProtocol {
    
    // MARK: Properties
    weak var presenter: InteractorToPresenterEditTaskProtocol?
    var persistentManager: PersistenceManager
    
    
    init(persistentManager: PersistenceManager) {
        self.persistentManager = persistentManager
    }
    
    
    func updateTask(newTitle: String, oldTitle: String) {
        persistentManager.updateTask(oldText: oldTitle, newText: newTitle)
        presenter?.editTaskSuccess()
    }
    
    
}
