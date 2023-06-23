//
//  Extensions.swift
//  ToDoList
//
//  Created by George Chang on 2023-06-22.
//

import Foundation
import UIKit

extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}

extension UIApplication {
    func addTapGestureRecognizer() {
        guard let window = (connectedScenes.first as? UIWindowScene)?.windows.first else { return }
           let tapGesture = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
           tapGesture.requiresExclusiveTouchType = false
           tapGesture.cancelsTouchesInView = false
           tapGesture.delegate = self
           window.addGestureRecognizer(tapGesture)
       }
}

extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true // set to `false` if you don't want to detect tap during other gestures
    }
}
