//
//
//  LoginView.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-09-01.
//

import SwiftUI

struct Constants {
    static let cornerRadius: CGFloat = 8.0
}
struct LoginView: View {
    @Binding var isAuthenticated: Bool   //parameter
    @State private var usernameEmail = ""
    @State private var password = ""
    @State private var isEditing = false
    
    
    private func hideKeyboard() {
    // Resign first responder to hide the keyboard
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        isEditing = false
    }
    
    var body: some View {
        ZStack() {
            Image("newbg")
                .resizable()
//                .scaledToFill()
                .ignoresSafeArea()
                .onTapGesture {
                    hideKeyboard()
                }
//            Spacer()
            GeometryReader { geometry in
                VStack() {
                    Spacer()
                    Text("ForTwo")
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .font(Font.custom("HermeneusOne-Regular", size: 40))
                        .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
//                        .padding(20)
                    
        //                .padding([.top, .bottom], 40)
                    Image("fortwologo")
                        .resizable()
                      .frame(width: 250, height: 250)
        //              .clipShape(Circle())
        //              .overlay(Circle().stroke(Color.white, lineWidth: 4))
                      .shadow(radius: 10)
                      .padding(.bottom, 50)
                    
                    Spacer()
                    VStack(alignment: .leading, spacing: 15) {
                      
                      TextField("Email", text: self.$usernameEmail)
                        .padding()
                        .onTapGesture {
                            // Set isEditing to true when the TextField is tapped
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
                                    
                      SecureField("Password", text: self.$password)
                        .padding()
                        .onTapGesture {
                            // Set isEditing to true when the TextField is tapped
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
                    
                    Button(action: {}) {
                      Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
//                        .background(Color.pink)
                        .background(Color(red: 0xdc / 255, green: 0x6d / 255, blue: 0x71 / 255))
                        .cornerRadius(30.0)
                    }
                    .padding([.top], 20)
                    .onTapGesture {
                        hideKeyboard()
                    }
                    .opacity((usernameEmail.isEmpty || password.isEmpty) ? 0.5 : 1.0)
                    .disabled(usernameEmail.isEmpty || password.isEmpty)
//                    .luminanceToAlpha(0.5)
                    
                    Button(action: {}) {  // add navigationlink like with below?
                      Text("Forgot Password")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .cornerRadius(15.0)
                        .underline()
                    }
                    .padding(10)
                    
                    Spacer()
                    
                    NavigationLink {
                        RegistrationView(isAuthenticated: $isAuthenticated)
                            .navigationBarHidden(true)
                    } label: {
                            Text("Don't have an account? Sign Up")
                            .font(.headline)
                            .foregroundColor(.black)
        //                    .padding([.top], 100)
                            .cornerRadius(15.0)
                    }
                    .padding()
//                        Text("Don't have an account? Sign Up")
//                        .font(.headline)
//                        .foregroundColor(.black)
//    //                    .padding([.top], 100)
//                        .cornerRadius(15.0)
                        
                    
//                    .padding()
    //                .offset(y: -20)
                }
            }
        }
//        .background(Image("newbg")
//            .resizable())
        
//        .aspectRatio(contentMode: .fill)
//        .ignoresSafeArea()
    }

private func login() {
        // Implement your login logic here
        print("Logging in")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isAuthenticated: .constant(false))
    }
}


//TextField("Username or Email", text: $usernameEmail)
//    .textFieldStyle(RoundedBorderTextFieldStyle())
//    .autocorrectionDisabled()
//    .textInputAutocapitalization(.none)
//    .clipped()
//    .cornerRadius(Constants.cornerRadius)
//    .background(Color(UIColor.secondarySystemBackground))
//    .padding()
//
//
//SecureField("Password", text: $password)
//    .textFieldStyle(RoundedBorderTextFieldStyle())
//    .autocorrectionDisabled()
//    .textInputAutocapitalization(.none)
//    .clipped()
//    .cornerRadius(Constants.cornerRadius)
//    .background(Color(UIColor.secondarySystemBackground))
//    .onSubmit {
//        // Perform an action, e.g., login, when hitting Enter on the password field
//        login()
//    }
//    .padding()
//
//Button("Log In") {
//    // Handle login button action
//}
//.clipped()
//.cornerRadius(Constants.cornerRadius)
//.background(Color(.blue))
//.foregroundColor(Color(.red))
//.padding()
//
//Button("Create an Account") {
//    //
//}
//.foregroundColor(.primary)
//.padding()
//
//Button("Terms") {
//    // Handle terms button action
//}
//.padding()
//
//Button("Privacy") {
//    // Handle privacy button action
//}
//.padding()
//
//// Header view (you can replace this with your own view)
//Spacer()
//
//Text("Header View")
//    .padding()
//    .clipped()
//    .background(Color(.red))
//    .frame(maxWidth: .infinity)
//    .edgesIgnoringSafeArea(.horizontal)
