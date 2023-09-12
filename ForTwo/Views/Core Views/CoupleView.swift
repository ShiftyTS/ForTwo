//
//  CoupleView.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-08-30.
//

import SwiftUI

struct CoupleView: View {
    @State private var coupleCode = ""
    @State private var nickname = ""
    @State private var isEditing = false
    @EnvironmentObject var viewModel: AuthViewModel

    func copyToClipboard(_ text: String) {
            let pasteboard = UIPasteboard.general
            pasteboard.string = text
    }
    
    private func hideKeyboard() {
    // Resign first responder to hide the keyboard
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        isEditing = false
    }
    // let couple = viewModel.currentCouple
    var body: some View {
        if let user = viewModel.currentUser {
            if let couple = viewModel.currentCouple {
                NavigationView {
                    ZStack {
                        Image("background")
                            .resizable()
                        //                .scaledToFill()
                            .ignoresSafeArea()
                            .onTapGesture {
                                hideKeyboard()
                            }
                        VStack{
                            if user.id == couple.uidOne {
                                HStack {
                                    //                        Spacer()
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
                                //                    .padding([.horizontal], 20)
                                .padding([.top], 40)
                            } else {
                                HStack {
                                    //                        Spacer()
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
                                //                    .padding([.horizontal], 20)
                                .padding([.top], 40)
                            }
//                            HStack {
//                                //                        Spacer()
//                                Text(couple.nicknameOne)
//                                    .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
//                                    .font(Font.custom("HermeneusOne-Regular", size: 17))
//                                Text("❤️")
//                                    .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
//                                    .font(Font.custom("HermeneusOne-Regular", size: 17))
//                                Text(couple.nicknameTwo)
//                                    .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
//                                    .font(Font.custom("HermeneusOne-Regular", size: 17))
//                            }
//                            //                    .padding([.horizontal], 20)
//                            .padding([.top], 40)
                            //                    .padding
                            
                            // Together for...
                            HStack {
                                //                        Spacer()
                                Text("Together for")
                                    .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                    .font(Font.custom("HermeneusOne-Regular", size: 17))
                                //                            .padding([.bottom], 2)
                                Text(String(couple.daysTogether))
                                    .foregroundColor(Color(.black))
                                    .font(Font.custom("ZapfinoExtraLT-One", size: 40))
                                    .padding([.top], 7)
                                Text("days")
                                    .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                    .font(Font.custom("HermeneusOne-Regular", size: 17))
                                //                            .padding([.bottom], 2)
                            }
                            
                            //                        Image("characterbed")
                            //                            .resizable()
                            //                            .scaledToFit()
                            //                            .scaleEffect(0.65)
                            
                            // user.connected
                            if user.connected {
                                //                            HStack {
                                Spacer()
                                GeometryReader { geometry in
                                    HStack {
                                        Spacer()
                                        
                                        //user.nickname
                                        TextField(user.nickname, text: self.$nickname)
                                            .padding([.vertical], 7)
                                            .padding([.horizontal], 7)
                                            .onTapGesture {
                                                // Set isEditing to true when the TextField is tapped
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
                                        Button(action: {
                                            //                                                    viewModel.didAuthenticateUser = true
                                            viewModel.changeNickname(newNickname: nickname, coupleUid: couple.id ?? "blahh", changeNicknameOne: user.enteredCode)
                                            //                                                    print(coupleCode)
                                            print("cur user")
                                            nickname = ""
                                            //                                                    print(self.currentUser?.id)
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
                                //                            .border(.red)
                            } else {
                                GeometryReader { geometry in
                                    VStack {
                                        //                                Spacer()
                                        
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
                                                
                                            //                                .overlay(
                                            //                                    Rectangle()
                                            //                                        .cornerRadius(30)
                                            //                                        .border(Color(red: 0xb2 / 255, green: 0xb2 / 255, blue: 0xb2 / 255))
                                            //                                        .frame(width: geometry.size.width, height: geometry.size.height / 1.5)
                                            //                                        .background(.clear)
                                            //                                )
                                            //                                .background(
                                            //                                    Rectangle()
                                            //                                        .fill(Color(red: 0xf8 / 255, green: 0xf8 / 255, blue: 0xf8 / 255))
                                            //                                        .frame(width: geometry.size.width, height: geometry.size.height / 1.5)
                                            //                                )
                                            //                                .border(Color(red: 0xb2 / 255, green: 0xb2 / 255, blue: 0xb2 / 255))
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
                                                    //                                        .underline()
                                                        .underline(true, color: Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                                        .baselineOffset(5.0)
                                                        .onTapGesture {
                                                            copyToClipboard(user.id ?? "")
                                                        }
                                                }
                                                TextField("Enter your partner's couple code", text: self.$coupleCode)
                                                    .padding()
                                                    .onTapGesture {
                                                        // Set isEditing to true when the TextField is tapped
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
                                                
                                                Button(action: {
                                                    //                                                    viewModel.didAuthenticateUser = true
                                                    viewModel.connectCouple(uidPartner: coupleCode)
                                                    //                                                    print(coupleCode)
                                                    print("cur user")
                                                    //                                                    print(self.currentUser?.id)
                                                }) {
                                                    Text("Connect")
                                                        .font(Font.custom("HermeneusOne-Regular", size: 20))
                                                        .foregroundColor(.white)
                                                        .frame(width: geometry.size.width / 1.5, height: 50)
                                                    //                        .background(Color.pink)
                                                        .background(Color(red: 0xdc / 255, green: 0x6d / 255, blue: 0x71 / 255))
                                                        .cornerRadius(30.0)
                                                }
                                                .padding([.top], 5)
                                                .onTapGesture {
                                                    hideKeyboard()
                                                }
                                                .opacity((coupleCode.isEmpty) ? 0.5 : 1.0)
                                                .disabled(coupleCode.isEmpty)
                                                
                                                //                                Spacer()  //spacer and maybe refresh if it does not refresh automatically?
                                                
                                                
                                            }
                                            
                                        }
                                        //                    .border(Color(red: 0xb2 / 255, green: 0xb2 / 255, blue: 0xb2 / 255))
                                        
                                        //                                Spacer()
                                    }
                                }
                                .padding([.horizontal], 30)
                            }
                            
                            
                            Spacer()
                            
                            VStack {
                                //                            Spacer()
                                Button(action: {
                                    viewModel.signOut()
                                }) {
                                    Text("Sign Out")
                                        .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                        .font(Font.custom("HermeneusOne-Regular", size: 17))
                                }
                                .padding(10)
                                
                                
                                // user.connected
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
                    //            .navigationTitle(Text("List")
                    //                                .font(Font.custom("ZapfinoExtraLT-One", size: 32)))
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
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
                        //                .scaledToFill()
                            .ignoresSafeArea()
                            .onTapGesture {
                                hideKeyboard()
                            }
                        VStack{
                            HStack {
                                //                        Spacer()
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
                            //                    .padding([.horizontal], 20)
                            .padding([.top], 40)
                            //                    .padding
                            
                            // Together for...
                            HStack {
                                //                        Spacer()
                                Text("Together for")
                                    .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                    .font(Font.custom("HermeneusOne-Regular", size: 17))
                                //                            .padding([.bottom], 2)
                                Text("0")
                                    .foregroundColor(Color(.black))
                                    .font(Font.custom("ZapfinoExtraLT-One", size: 40))
                                    .padding([.top], 7)
                                Text("days")
                                    .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                    .font(Font.custom("HermeneusOne-Regular", size: 17))
                                //                            .padding([.bottom], 2)
                            }
                            
                            //                        Image("characterbed")
                            //                            .resizable()
                            //                            .scaledToFit()
                            //                            .scaleEffect(0.65)
                            
                            // user.connected
                            if user.connected {
                                //                            HStack {
                                Spacer()
                                GeometryReader { geometry in
                                    HStack {
                                        Spacer()
                                        
                                        //user.nickname
                                        TextField(user.nickname ?? "", text: self.$nickname)
                                            .padding([.vertical], 7)
                                            .padding([.horizontal], 7)
                                            .onTapGesture {
                                                // Set isEditing to true when the TextField is tapped
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
                                        Button(action: {
                                            //                                                    viewModel.didAuthenticateUser = true
                                            //                                        viewModel.changeNickname(newNickname: nickname, coupleUid: couple.id ?? "blahh")
                                            //                                                    print(coupleCode)
                                            print("cur user")
                                            //                                                    print(self.currentUser?.id)
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
                                //                            .border(.red)
                            } else {
                                GeometryReader { geometry in
                                    VStack {
                                        //                                Spacer()
                                        
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
                                            //                                .overlay(
                                            //                                    Rectangle()
                                            //                                        .cornerRadius(30)
                                            //                                        .border(Color(red: 0xb2 / 255, green: 0xb2 / 255, blue: 0xb2 / 255))
                                            //                                        .frame(width: geometry.size.width, height: geometry.size.height / 1.5)
                                            //                                        .background(.clear)
                                            //                                )
                                            //                                .background(
                                            //                                    Rectangle()
                                            //                                        .fill(Color(red: 0xf8 / 255, green: 0xf8 / 255, blue: 0xf8 / 255))
                                            //                                        .frame(width: geometry.size.width, height: geometry.size.height / 1.5)
                                            //                                )
                                            //                                .border(Color(red: 0xb2 / 255, green: 0xb2 / 255, blue: 0xb2 / 255))
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
                                                    //                                        .underline()
                                                        .underline(true, color: Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                                        .baselineOffset(5.0)
                                                        .onTapGesture {
                                                            copyToClipboard(user.id ?? "")
                                                        }
                                                }
                                                TextField("Enter your partner's couple code", text: self.$coupleCode)
                                                    .padding()
                                                    .onTapGesture {
                                                        // Set isEditing to true when the TextField is tapped
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
                                                
                                                Button(action: {
                                                    //                                                    viewModel.didAuthenticateUser = true
                                                    viewModel.connectCouple(uidPartner: coupleCode)
                                                    //                                                    print(coupleCode)
                                                    print("cur user")
                                                    //                                                    print(self.currentUser?.id)
                                                }) {
                                                    Text("Connect")
                                                        .font(Font.custom("HermeneusOne-Regular", size: 20))
                                                        .foregroundColor(.white)
                                                        .frame(width: geometry.size.width / 1.5, height: 50)
                                                    //                        .background(Color.pink)
                                                        .background(Color(red: 0xdc / 255, green: 0x6d / 255, blue: 0x71 / 255))
                                                        .cornerRadius(30.0)
                                                }
                                                .padding([.top], 5)
                                                .onTapGesture {
                                                    hideKeyboard()
                                                }
                                                .opacity((coupleCode.isEmpty) ? 0.5 : 1.0)
                                                .disabled(coupleCode.isEmpty)
                                                
                                                //                                Spacer()  //spacer and maybe refresh if it does not refresh automatically?
                                                
                                                
                                            }
                                            
                                        }
                                        //                    .border(Color(red: 0xb2 / 255, green: 0xb2 / 255, blue: 0xb2 / 255))
                                        
                                        //                                Spacer()
                                    }
                                }
                                .padding([.horizontal], 30)
                            }
                            
                            
                            Spacer()
                            
                            VStack {
                                //                            Spacer()
                                Button(action: {
                                    viewModel.signOut()
                                }) {
                                    Text("Sign Out")
                                        .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                        .font(Font.custom("HermeneusOne-Regular", size: 17))
                                }
                                .padding(10)
                                
                                
                                // user.connected
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
                    //            .navigationTitle(Text("List")
                    //                                .font(Font.custom("ZapfinoExtraLT-One", size: 32)))
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Settings")
                                .font(Font.custom("ZapfinoExtraLT-One", size: 32))
                        }
                    }
                }
            }
            //        } else {
            //            Text("Fail")
            //        }
        } else {
//            Text("Fail")
        }
    }
}

struct CoupleView_Previews: PreviewProvider {
    static var previews: some View {
        CoupleView()
            .environmentObject(AuthViewModel())
    }
}



//                    HStack {
//                        Text("Couple code:")
//                            .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
//                            .font(Font.custom("HermeneusOne-Regular", size: 17))
////                            .padding(30)
//                        Spacer()
//                    }
//                        GeometryReader { geometry in
//        //                        Spacer()
//                            ZStack {
//                                Rectangle()
//                                    .foregroundColor(Color(red: 0xe0 / 255, green: 0xdd / 255, blue: 0xd7 / 255))
//        //                            .foregroundColor(.red)
//        //                            .fram
//                                    .frame(width: geometry.size.width, height: geometry.size.height / 3)
//                                    .cornerRadius(20)
////                                    .border(.red)
//                                VStack {
//                                    Text("Couple code:")
//                                        .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
//                                        .font(Font.custom("HermeneusOne-Regular", size: 20))
//                                        .multilineTextAlignment(.center)
//                                        .padding(5)
////                                    Text("123456789abcdxe")
////                                        .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
////                                        .font(Font.custom("HermeneusOne-Regular", size: 20))
////                                        .multilineTextAlignment(.center)
////                                        .padding(5)
//////                                        .underline()
////                                        .underline(true, color: Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
////                                        .baselineOffset(5.0)
////                                        .onTapGesture {
////                                            copyToClipboard("123456789abcdxe")
////                                        }
//                                    Button(action: {}) {
//                                        Text("123456789abcdxe")
//                                            .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
//                                            .font(Font.custom("HermeneusOne-Regular", size: 20))
//                                            .multilineTextAlignment(.center)
//                                            .padding(5)
//                                        //                                        .underline()
//                                            .underline(true, color: Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
//                                            .baselineOffset(5.0)
//                                            .onTapGesture {
//                                                copyToClipboard("123456789abcdxe")
//                                            }
//                                    }
//////                                    Text("Test")
////
////
////
//////                                    Spacer()
//////                                    Text("Together for")
//////                                        .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
//////                                        .font(Font.custom("HermeneusOne-Regular", size: 17))
////                                }
////                                Text("Test")
//                            }
////                            Text("Test")
//                        }
////                        .border(.red)
//                        .padding(30)
                    
//                        if viewModel.userSession.
                    
                    
                    
                    
                    
//                        Text("Test")
