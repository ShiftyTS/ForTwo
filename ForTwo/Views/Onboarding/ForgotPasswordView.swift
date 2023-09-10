//
//
//  LoginView.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-09-01.
//

import SwiftUI
//
//struct Constants {
//    static let cornerRadius: CGFloat = 8.0
//}
struct ForgotPasswordView: View {
//    @Binding var isAuthenticated: Bool   //parameter
    @State private var email = ""
//    @State private var nickname = ""
    @State private var isEditing = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
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
//                    Spacer()
                    ZStack (alignment: .topLeading) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            HStack {
                                Image("backicon")
                                    .resizable()
                                    .scaledToFit()
//                                    .scaleEffect(0.1)
                            }
                        })
//                        .padding(10)
//                        Spacer()
                    }
                    .frame(width: geometry.size.width / 10, height: geometry.size.width / 10)
                    .offset(x: -geometry.size.width / 2.4)
//                    .border(.red)
                    
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
                    
//                    Spacer()
                    VStack(alignment: .leading, spacing: 15) {
                        TextField("Email", text: self.$email)
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
    //                .offset(y: -20)
                    Spacer()
                }
            }
        }
//        .background(Image("newbg")
//            .resizable())
        
//        .aspectRatio(contentMode: .fill)
//        .ignoresSafeArea()
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
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
