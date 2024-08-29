//
//  EditTaskViewController.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 29.08.2024.
//  
//

import UIKit

class EditTaskViewController: UIViewController {
    
   
    // MARK: - Properties
    var presenter: ViewToPresenterEditTaskProtocol?
    var output: EditTodoEventHandler?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    
    private func configureViewController() {
        title = Constants.String.editTask
        view.backgroundColor = Constants.Color.background
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeTapped))
    }
    
    
    @objc private func closeTapped() {
        output?.cancelEditTaskClicked()
    }
}

extension EditTaskViewController: PresenterToViewEditTaskProtocol{
    // TODO: Implement View Output Methods
}
