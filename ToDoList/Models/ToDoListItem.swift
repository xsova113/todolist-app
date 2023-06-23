//
//  ToDoLIstItem.swift
//  ToDoList
//
//  Created by George Chang on 2023-06-22.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state:Bool) {
        isDone = state
    }
}
