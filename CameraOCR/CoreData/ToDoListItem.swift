//
//  ToDoListItem.swift
//  CameraOCR
//
//  Created by Zisis Kostakakis on 28/01/2022.
//

import Foundation
import CoreData

class ToDoListItem: NSManagedObject, Identifiable {
    @NSManaged var name: String?
    @NSManaged var createAt: Date?
}
extension ToDoListItem {
    static func getAllToDoListItems() -> NSFetchRequest<ToDoListItem> {
        let request: NSFetchRequest<ToDoListItem> = ToDoListItem.fetchRequest() as!
        NSFetchRequest<ToDoListItem>
        let sort = NSSortDescriptor(key: "createAt", ascending: true)
        request.sortDescriptors = [sort]
        
        return request
    }
}
