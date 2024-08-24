//
//  HomePresenter.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 23.08.2024.
//  
//

import Foundation

class HomePresenter: ViewToPresenterHomeProtocol {

    // MARK: Properties
    var view: PresenterToViewHomeProtocol?
    var interactor: PresenterToInteractorHomeProtocol?
    var router: PresenterToRouterHomeProtocol?
}

extension HomePresenter: InteractorToPresenterHomeProtocol {
    
}
