//
//  ConnectionView.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-09-08.
//

import SwiftUI

struct ConnectionView: View {
    @State private var coupleCode = ""
    @State private var isEditing = false
    
    func copyToClipboard(_ text: String) {
            let pasteboard = UIPasteboard.general
            pasteboard.string = text
    }
    
    private func hideKeyboard() {
    // Resign first responder to hide the keyboard
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
                VStack {
                    Spacer()
                    
                    ZStack {
                            Rectangle()
                                .foregroundColor(Color(red: 0xe7 / 255, green: 0xda / 255, blue: 0xda / 255))
                                .frame(width: geometry.size.width, height: geometry.size.height / 1.5)
                                .cornerRadius(30)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color(red: 0xaf / 255, green: 0xaf / 255, blue: 0xaf / 255), lineWidth: 1)
                                )
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
                                Text("Guide: enter your partners code or have your partner aenter your code to sync your ForTwo profiles")
                                Text("Couple code:")
                                    .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                    .font(Font.custom("HermeneusOne-Regular", size: 20))
                                    .multilineTextAlignment(.center)
                                    .padding(5)
                                Button(action: {}) {
                                    Text("123456789abcdxee")
                                        .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                        .font(Font.custom("HermeneusOne-Regular", size: 20))
                                        .multilineTextAlignment(.center)
                                        .padding(5)
                                    //                                        .underline()
                                        .underline(true, color: Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                        .baselineOffset(5.0)
                                        .onTapGesture {
                                            copyToClipboard("123456789abcdxe")
                                        }
                                }
                                TextField("Enter your partner's couple code", text: self.$coupleCode)
                                  .padding()
                                  .onTapGesture {
                                      // Set isEditing to true when the TextField is tapped
                                      isEditing = true
                                  }
                                  .background(Color(UIColor.secondarySystemBackground))
                                  .cornerRadius(20.0)
                                  .autocorrectionDisabled()
                                  .disableAutocorrection(true)
                                  .textInputAutocapitalization(.none)
                                  .overlay(
                                      RoundedRectangle(cornerRadius: 20)
                                          .stroke(Color.gray, lineWidth: 0.5)
                                  )
                            }
                        
                    }
//                    .border(Color(red: 0xb2 / 255, green: 0xb2 / 255, blue: 0xb2 / 255))
                    
                    Spacer()
                }
            }
            .padding(30)
        }
    }
}

struct ConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectionView()
    }
}
