//
//  User.swift
//  ToDoList
//
//  Created by George Chang on 2023-06-22.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
