//
//  ProfileViewViewModel.swift
//  ToDoList
//
//  Created by George Chang on 2023-06-22.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewModel: ObservableObject {
    @Published var user: User? = nil
    
    init() {}
    
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .getDocument { [weak self] snapShot, error in
                guard let data = snapShot?.data(), error == nil else {
                    return
                }
                
                DispatchQueue.main.async {
                    self?.user = User(id: data["id"] as? String ?? "",
                                      name: data["name"] as? String ?? "",
                                      email: data["email"] as? String ?? "",
                                      joined: data["joined"] as? TimeInterval ?? 0)
                }
            }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
