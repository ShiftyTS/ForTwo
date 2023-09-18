//
//  CoupleView.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-08-30.
//

import SwiftUI

// Displays the couple tab
struct CoupleView: View {
    
    @State private var coupleCode = ""
    @State private var nickname = ""
    @State private var isEditing = false
    
    @EnvironmentObject var viewModel: AuthViewModel

    // Copies given text to the pasteboard
    func copyToClipboard(_ text: String) {
            let pasteboard = UIPasteboard.general
            pasteboard.string = text
    }
    
    // Hides the keyboard
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        isEditing = false
    }
    
    var body: some View {
        if let user = viewModel.currentUser {
            if let couple = viewModel.currentCouple {
                NavigationView {
                    ZStack {
                        Image("background")
                            .resizable()
                            .ignoresSafeArea()
                            .onTapGesture {
                                hideKeyboard()
                            }
                        
                        // Displays current user's name first
                        VStack{
                            if user.id == couple.uidOne {
                                
                                // Couple
                                HStack {
                                    Text(couple.nicknameOne)
                                        .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                        .font(Font.custom("HermeneusOne-Regular", size: 17))
                                    Text("❤️")
                                        .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                        .font(Font.custom("HermeneusOne-Regular", size: 17))
                                    Text(couple.nicknameTwo)
                                        .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                        .font(Font.custom("HermeneusOne-Regular", size: 17))
                                }
                                .padding([.top], 40)
                            } else {
                                HStack {
                                    
                                    // Couple
                                    Text(couple.nicknameTwo)
                                        .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                        .font(Font.custom("HermeneusOne-Regular", size: 17))
                                    Text("❤️")
                                        .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                        .font(Font.custom("HermeneusOne-Regular", size: 17))
                                    Text(couple.nicknameOne)
                                        .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                        .font(Font.custom("HermeneusOne-Regular", size: 17))
                                }
                                .padding([.top], 40)
                            }
                            
                            HStack {

                                // Number of days together
                                Text("Together for")
                                    .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                    .font(Font.custom("HermeneusOne-Regular", size: 17))
                                Text(String(couple.daysTogether))
                                    .foregroundColor(Color(.black))
                                    .font(Font.custom("ZapfinoExtraLT-One", size: 40))
                                    .padding([.top], 7)
                                Text("days")
                                    .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                    .font(Font.custom("HermeneusOne-Regular", size: 17))
                            }

                            // Displays specific content if the user is already connected as a couple
                            if user.connected {
                                Spacer()
                                GeometryReader { geometry in
                                    HStack {
                                        
                                        Spacer()
                                        
                                        // Takes in user input for new nickname
                                        TextField(user.nickname, text: self.$nickname)
                                            .padding([.vertical], 7)
                                            .padding([.horizontal], 7)
                                            .onTapGesture {
                                                isEditing = true
                                            }
                                            .font(Font.custom("HermeneusOne-Regular", size: 16))
                                            .background(.clear)
                                            .cornerRadius(5.0)
                                            .autocorrectionDisabled()
                                            .disableAutocorrection(true)
                                            .textInputAutocapitalization(.none)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 5)
                                                    .stroke(Color(red: 0xaf / 255, green: 0xaf / 255, blue: 0xaf / 255), lineWidth: 0.5)
                                            )
                                            .frame(width: geometry.size.width / 2)
                                        
                                        // Updates nickname
                                        Button(action: {
                                            viewModel.changeNickname(newNickname: nickname, coupleUid: couple.id ?? "", changeNicknameOne: user.enteredCode)
                                            nickname = ""
                                        }) {
                                            Image(systemName: isEditing ? "checkmark" : "pencil")
                                                .foregroundColor(.blue)
                                        }
                                        
                                        Spacer()
                                        
                                    }
                                    
                                    Spacer()
                                    
                                    Image("characterbed")
                                        .resizable()
                                        .scaledToFit()
                                        .scaleEffect(0.65)
                                }
                            } else {
                                GeometryReader { geometry in
                                    VStack {
                                        ZStack {
                                            Rectangle()
                                                .foregroundColor(Color(red: 0xe7 / 255, green: 0xda / 255, blue: 0xda / 255))
                                                .frame(width: geometry.size.width, height: geometry.size.height)
                                                .cornerRadius(30)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 30)
                                                        .stroke(Color(red: 0xaf / 255, green: 0xaf / 255, blue: 0xaf / 255), lineWidth: 1)
                                                )
                                                .onTapGesture {
                                                    hideKeyboard()
                                                }
                                                
                                            // Displays instructions on how to connect to another user's account to form a couple
                                            VStack {
                                                Text("Guide: Enter your partners code or wait for your partner to enter your code to connect your ForTwo profiles")
                                                    .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                                    .font(Font.custom("HermeneusOne-Regular", size: 20))
                                                    .multilineTextAlignment(.center)
                                                    .padding([.horizontal], 30)
                                                    .padding([.vertical], 10)
                                                Text("Couple code:")
                                                    .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                                    .font(Font.custom("HermeneusOne-Regular", size: 20))
                                                    .multilineTextAlignment(.center)
                                                    .padding(5)
                                                Button(action: {}) {
                                                    Text(user.id ?? "")
                                                        .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                                        .font(Font.custom("HermeneusOne-Regular", size: 16))
                                                        .multilineTextAlignment(.center)
                                                        .padding(5)
                                                        .underline(true, color: Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                                        .baselineOffset(5.0)
                                                        .onTapGesture {
                                                            copyToClipboard(user.id ?? "")
                                                        }
                                                }
                                                
                                                // Takes in couple code
                                                TextField("Enter your partner's couple code", text: self.$coupleCode)
                                                    .padding()
                                                    .onTapGesture {
                                                        isEditing = true
                                                    }
                                                    .font(Font.custom("HermeneusOne-Regular", size: 16))
                                                    .background(Color(UIColor.secondarySystemBackground))
                                                    .cornerRadius(10.0)
                                                    .autocorrectionDisabled()
                                                    .disableAutocorrection(true)
                                                    .textInputAutocapitalization(.none)
                                                    .overlay(
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .stroke(Color.gray, lineWidth: 0.5)
                                                    )
                                                    .frame(width: geometry.size.width / 1.2)
                                                
                                                // Tries to connect as a couple using the given code
                                                Button(action: {
                                                    viewModel.connectCouple(uidPartner: coupleCode)
                                                }) {
                                                    Text("Connect")
                                                        .font(Font.custom("HermeneusOne-Regular", size: 20))
                                                        .foregroundColor(.white)
                                                        .frame(width: geometry.size.width / 1.5, height: 50)
                                                        .background(Color(red: 0xdc / 255, green: 0x6d / 255, blue: 0x71 / 255))
                                                        .cornerRadius(30.0)
                                                }
                                                .padding([.top], 5)
                                                .onTapGesture {
                                                    hideKeyboard()
                                                }
                                                .opacity((coupleCode.isEmpty) ? 0.5 : 1.0)
                                                .disabled(coupleCode.isEmpty)
                                            }
                                            
                                        }
                                    }
                                }
                                .padding([.horizontal], 30)
                            }
                            
                            Spacer()
                            
                            VStack {
                                
                                // Sign out button
                                Button(action: {
                                    viewModel.signOut()
                                }) {
                                    Text("Sign Out")
                                        .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                        .font(Font.custom("HermeneusOne-Regular", size: 17))
                                }
                                .padding(10)
                                
                                // Disconnect with partner button
                                if user.connected {
                                    Button(action: {}) {
                                        Text("Disconnect with partner 💔")
                                            .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                            .font(Font.custom("HermeneusOne-Regular", size: 17))
                                    }
                                    .padding(10)
                                }
                            }
                            .padding(10)
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            
                            // Header
                            Text("Settings")
                                .font(Font.custom("ZapfinoExtraLT-One", size: 32))
                        }
                    }
                }
            } else {
                NavigationView {
                    ZStack {
                        Image("background")
                            .resizable()
                            .ignoresSafeArea()
                            .onTapGesture {
                                hideKeyboard()
                            }
                        
                        VStack{
                            
                            // Couple
                            HStack {
                                Text("Name1")
                                    .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                    .font(Font.custom("HermeneusOne-Regular", size: 17))
                                Text("❤️")
                                    .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                    .font(Font.custom("HermeneusOne-Regular", size: 17))
                                Text("Name2")
                                    .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                    .font(Font.custom("HermeneusOne-Regular", size: 17))
                            }
                            .padding([.top], 40)
                            
                            // Number of days together
                            HStack {
                                Text("Together for")
                                    .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                    .font(Font.custom("HermeneusOne-Regular", size: 17))
                                Text("0")
                                    .foregroundColor(Color(.black))
                                    .font(Font.custom("ZapfinoExtraLT-One", size: 40))
                                    .padding([.top], 7)
                                Text("days")
                                    .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                    .font(Font.custom("HermeneusOne-Regular", size: 17))
                            }
                            
                            // Displays specific content if the user is already connected as a couple
                            if user.connected {
                                
                                Spacer()
                                
                                GeometryReader { geometry in
                                    HStack {
                                        
                                        Spacer()
                                        
                                        // Takes in user input for new nickname
                                        TextField(user.nickname ?? "", text: self.$nickname)
                                            .padding([.vertical], 7)
                                            .padding([.horizontal], 7)
                                            .onTapGesture {
                                                isEditing = true
                                            }
                                            .font(Font.custom("HermeneusOne-Regular", size: 16))
                                            .background(.clear)
                                            .cornerRadius(5.0)
                                            .autocorrectionDisabled()
                                            .disableAutocorrection(true)
                                            .textInputAutocapitalization(.none)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 5)
                                                    .stroke(Color(red: 0xaf / 255, green: 0xaf / 255, blue: 0xaf / 255), lineWidth: 0.5)
                                            )
                                            .frame(width: geometry.size.width / 2)
                                        
                                        // Updates nickname
                                        Button(action: {
//                                            viewModel.changeNickname(newNickname: nickname, coupleUid: couple.id ?? "", changeNicknameOne: user.enteredCode)
//                                            nickname = ""
                                        }) {
                                            Image(systemName: isEditing ? "checkmark" : "pencil")
                                                .foregroundColor(.blue)
                                        }
                                        
                                        Spacer()
                                        
                                    }
                                    
                                    Spacer()
                                    
                                    Image("characterbed")
                                        .resizable()
                                        .scaledToFit()
                                        .scaleEffect(0.65)
                                }
                            } else {
                                GeometryReader { geometry in
                                    VStack {
                                        ZStack {
                                            Rectangle()
                                                .foregroundColor(Color(red: 0xe7 / 255, green: 0xda / 255, blue: 0xda / 255))
                                                .frame(width: geometry.size.width, height: geometry.size.height)
                                                .cornerRadius(30)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 30)
                                                        .stroke(Color(red: 0xaf / 255, green: 0xaf / 255, blue: 0xaf / 255), lineWidth: 1)
                                                )
                                                .onTapGesture {
                                                    hideKeyboard()
                                                }

                                            // Displays instructions on how to connect to another user's account to form a couple
                                            VStack {
                                                Text("Guide: Enter your partners code or wait for your partner to enter your code to connect your ForTwo profiles")
                                                    .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                                    .font(Font.custom("HermeneusOne-Regular", size: 20))
                                                    .multilineTextAlignment(.center)
                                                    .padding([.horizontal], 30)
                                                    .padding([.vertical], 10)
                                                Text("Couple code:")
                                                    .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                                    .font(Font.custom("HermeneusOne-Regular", size: 20))
                                                    .multilineTextAlignment(.center)
                                                    .padding(5)
                                                Button(action: {}) {
                                                    Text(user.id ?? "")
                                                        .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                                        .font(Font.custom("HermeneusOne-Regular", size: 16))
                                                        .multilineTextAlignment(.center)
                                                        .padding(5)
                                                        .underline(true, color: Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                                        .baselineOffset(5.0)
                                                        .onTapGesture {
                                                            copyToClipboard(user.id ?? "")
                                                        }
                                                }
                                                
                                                // Takes in couple code
                                                TextField("Enter your partner's couple code", text: self.$coupleCode)
                                                    .padding()
                                                    .onTapGesture {
                                                        isEditing = true
                                                    }
                                                    .font(Font.custom("HermeneusOne-Regular", size: 16))
                                                    .background(Color(UIColor.secondarySystemBackground))
                                                    .cornerRadius(10.0)
                                                    .autocorrectionDisabled()
                                                    .disableAutocorrection(true)
                                                    .textInputAutocapitalization(.none)
                                                    .overlay(
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .stroke(Color.gray, lineWidth: 0.5)
                                                    )
                                                    .frame(width: geometry.size.width / 1.2)
                                                
                                                // Tries to connect as a couple using the given code
                                                Button(action: {
                                                    viewModel.connectCouple(uidPartner: coupleCode)
                                                }) {
                                                    Text("Connect")
                                                        .font(Font.custom("HermeneusOne-Regular", size: 20))
                                                        .foregroundColor(.white)
                                                        .frame(width: geometry.size.width / 1.5, height: 50)
                                                        .background(Color(red: 0xdc / 255, green: 0x6d / 255, blue: 0x71 / 255))
                                                        .cornerRadius(30.0)
                                                }
                                                .padding([.top], 5)
                                                .onTapGesture {
                                                    hideKeyboard()
                                                }
                                                .opacity((coupleCode.isEmpty) ? 0.5 : 1.0)
                                                .disabled(coupleCode.isEmpty)
                                            }
                                            
                                        }
                                    }
                                }
                                .padding([.horizontal], 30)
                            }
                            
                            
                            Spacer()
                            
                            // Sign out button
                            VStack {
                                Button(action: {
                                    viewModel.signOut()
                                }) {
                                    Text("Sign Out")
                                        .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                        .font(Font.custom("HermeneusOne-Regular", size: 17))
                                }
                                .padding(10)
                                
                                
                                // Disconnect with partner button
                                if user.connected {
                                    Button(action: {
                                        
                                    }) {
                                        Text("Disconnect with partner 💔")
                                            .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                            .font(Font.custom("HermeneusOne-Regular", size: 17))
                                    }
                                    .padding(10)
                                }
                            }
                            .padding(10)
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            
                            // Header
                            Text("Settings")
                                .font(Font.custom("ZapfinoExtraLT-One", size: 32))
                        }
                    }
                }
            }
        }
    }
}
