//
//  Tasks.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 24.08.2024.
//

import Foundation


struct Tasks: Codable, Hashable {
    let todos: [Todo]
    let total, skip, limit: Int
}


struct Todo: Codable, Hashable {
    let id: Int
    let todo: String
    let completed: Bool
    let userID: Int

    enum CodingKeys: String, CodingKey {
        case id, todo, completed
        case userID = "userId"
    }
}
