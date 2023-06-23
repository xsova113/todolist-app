//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by George Chang on 2023-06-21.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().onAppear {
                UIApplication.shared.addTapGestureRecognizer()
            }
        }
    }
}

