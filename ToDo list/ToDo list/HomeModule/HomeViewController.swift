//
//  HomeViewController.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 23.08.2024.
//  
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }

    // MARK: - Properties
    var presenter: ViewToPresenterHomeProtocol?
    
}

extension HomeViewController: PresenterToViewHomeProtocol{
    // TODO: Implement View Output Methods
}
