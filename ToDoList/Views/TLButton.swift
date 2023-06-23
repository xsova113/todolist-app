//
//  TLButton.swift
//  ToDoList
//
//  Created by George Chang on 2023-06-22.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                
                Text(title)
                    .bold()
                    .foregroundColor(Color.white)
            }
        }
        .padding(.top, 30)
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title: "value", backgroundColor: .pink) {
            // Action
        }
    }
}
