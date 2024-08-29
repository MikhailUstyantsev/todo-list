//
//  Constants.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 24.08.2024.
//

import UIKit

enum Constants {
    
    
    enum Color {
        static let red = UIColor(hexString: "#E62815")
        static let pink = UIColor(hexString: "#ff7373")
        static let purpleLight = UIColor(hexString: "#abb5ff")
        static let purpleIntense = UIColor(hexString: "#5148b2")
        static let background = UIColor(named: "background")
    }
    
    
    enum API {
        static let todosApiString = "https://dummyjson.com/todos"
    }
    
    
    enum String {
        static let homeScreenTitle = "Tasks"
        static let addNewTask = "Add New Task"
        static let add = "Add"
        static let error = "Error"
        static let cancel = "Cancel"
        static let fillOutTheForm = "Please fill out the form"
        static let selectAction = "Select action"
        static let edit = "Edit"
        static let editTask = "Edit Task"
        static let update = "Update"
        static let delete = "Delete"
    }
    
    
    enum Fonts {
        
        static func montserratRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Montserrat-Regular", size: size) ?? UIFont()
        }
        
        static func montserratMedium(with size: CGFloat) -> UIFont {
            UIFont(name: "Montserrat-Medium", size: size) ?? UIFont()
        }
        
        static func montserratSemiBold(with size: CGFloat) -> UIFont {
            UIFont(name: "Montserrat-SemiBold", size: size) ?? UIFont()
        }
    }
    
}
