//
//  LoginView.swift
//  ToDoList
//
//  Created by George Chang on 2023-06-22.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    @FocusState private var isFocused: Bool
    @StateObject private var keyboardHandler = KeyboardHandler()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, background: .pink)
                
                //Login form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(
                        title: "Log In",
                        backgroundColor: .blue
                    ) {
                        viewModel.login()
                        isFocused = false
                    }
                }
                .offset(y: -50)
                .scrollContentBackground(.hidden)
                //Create account
                VStack {
                    Text("New around here?")
                    NavigationLink("Create An Account") {
                        RegisterView()
                    }
                }
                .padding(.bottom, 50)
                
                Spacer()    
            }
            .padding(.bottom, -keyboardHandler.keyboardHeight)
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
