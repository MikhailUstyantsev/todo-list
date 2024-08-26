//
//  Goal+CoreDataProperties.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 26.08.2024.
//
//

import Foundation
import CoreData


extension Goal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Goal> {
        return NSFetchRequest<Goal>(entityName: "Goal")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var completed: Bool
    @NSManaged public var text: String?

}

extension Goal : Identifiable {

}
