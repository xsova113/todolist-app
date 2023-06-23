//
//  RegisterView.swift
//  ToDoList
//
//  Created by George Chang on 2023-06-22.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
//    @StateObject var keyboardHandler = KeyboardHandler()
    @FocusState var isShow: Bool
    
    var body: some View {
        VStack {
            HeaderView(title: "Register", subtitle: "Start organizing todos", angle: -15, background: .orange)
                .padding(.bottom, isShow ? -100 : 0)
            
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .focused($isShow)
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .focused($isShow)
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .focused($isShow)
                TLButton(title: "Create Account", backgroundColor: .orange) {
                    viewModel.register()
                }
            }
            .offset(y: -50)
            .scrollContentBackground(.hidden)
            
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
