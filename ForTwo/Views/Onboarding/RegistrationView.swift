//
//
//  RegistrationView.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-09-01.
//

import SwiftUI

// Displays registration page
struct RegistrationView: View {
    @Binding var isAuthenticated: Bool
    @State private var email = ""
    @State private var password = ""
    @State private var isEditing = false
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    // Hides keyboard
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        isEditing = false
    }
    
    var body: some View {
            VStack {
                ZStack() {
                    Image("newbg")
                        .resizable()
                        .ignoresSafeArea()
                        .onTapGesture {
                            hideKeyboard()
                        }

                    GeometryReader { geometry in
                        VStack() {
                            
                            Spacer()
                            
                            // App name
                            Text("ForTwo")
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .font(Font.custom("HermeneusOne-Regular", size: 40))
                                .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))

                            // Logo
                            Image("fortwologo")
                                .resizable()
                                .frame(width: 250, height: 250)
                                .shadow(radius: 10)
                                .padding(.bottom, 50)
                            
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 15) {
                                
                                // Email input
                                TextField("Email", text: self.$email)
                                    .padding()
                                    .onTapGesture {
                                        isEditing = true
                                    }
                                    .background(Color(UIColor.secondarySystemBackground))
                                    .cornerRadius(20.0)
                                    .autocorrectionDisabled()
                                    .textInputAutocapitalization(.none)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.gray, lineWidth: 0.5)
                                    )
                                
                                // Password input
                                SecureField("Password", text: self.$password)
                                    .padding()
                                    .onTapGesture {
                                        isEditing = true
                                    }
                                    .background(Color(UIColor.secondarySystemBackground))
                                    .cornerRadius(20.0)
                                    .autocorrectionDisabled()
                                    .textInputAutocapitalization(.none)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.gray, lineWidth: 0.5)
                                    )
                            }.padding([.leading, .trailing], 27.5)
                            
                            // Attempts to register a new account using the given email and password
                            Button(action: {
                                viewModel.register(userEmail: email,
                                                   userPassword: password)
                            }) {
                                Text("Sign Up")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(width: 300, height: 50)
                                    .background(Color(red: 0xdc / 255, green: 0x6d / 255, blue: 0x71 / 255))
                                    .cornerRadius(30.0)
                            }
                            .padding([.top], 20)
                            .onTapGesture {
                                hideKeyboard()
                            }
                            .opacity((email.isEmpty || password.isEmpty) ? 0.5 : 1.0)
                            .disabled(email.isEmpty || password.isEmpty)
                            
                            // Register for an account using Google
                            VStack {
                                HStack {
                                    Text("⸻")
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .font(Font.custom("HermeneusOne-Regular", size: 18))
                                        .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                    Text("OR")
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .font(Font.custom("HermeneusOne-Regular", size: 14))
                                        .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                    Text("⸻")
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .font(Font.custom("HermeneusOne-Regular", size: 18))
                                        .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                }
                                Button(action: {}) {
                                    Image("googleicon")
                                        .resizable()
                                        .scaledToFit()
                                        .scaleEffect(0.75)
                                }
                            }
                            
                            Spacer()
                            
                            // Dismisses the registration page (returns to login page)
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                Text("Already have an account? Sign in")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .cornerRadius(15.0)
                            }
                            .padding()
                        }
                    }
                }
            }
    }
}
