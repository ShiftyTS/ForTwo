//
//  ForogtPasswordView.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-09-01.
//

import SwiftUI

// Displays the forgot password page
struct ForgotPasswordView: View {
    @State private var email = ""
    @State private var isEditing = false
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    // Hides the keyboard
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        isEditing = false
    }
    
    var body: some View {
        ZStack() {
            Image("newbg")
                .resizable()
                .ignoresSafeArea()
                .onTapGesture {
                    hideKeyboard()
                }
            
            GeometryReader { geometry in
                VStack() {
                    ZStack (alignment: .topLeading) {
                        
                        // Dismisses the forgot password page and returns to login page
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            HStack {
                                Image("backicon")
                                    .resizable()
                                    .scaledToFit()
                            }
                        })
                    }
                    .frame(width: geometry.size.width / 10, height: geometry.size.width / 10)
                    .offset(x: -geometry.size.width / 2.4)

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
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 0.5)
                        )
                    }.padding([.leading, .trailing], 27.5)
                    
                    // Sends a password recovery email to the given email address
                    Button(action: {
                        viewModel.recoverPassword(userEmail: email)
                    }) {
                      Text("Recover password")
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
                    .opacity((email.isEmpty) ? 0.5 : 1.0)
                    .disabled(email.isEmpty)
                    .padding()
                    
                    Spacer()
                    
                }
            }
        }
    }
}
