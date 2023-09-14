////
////  ConnectionView.swift  (OLD UNUSED FILE, SWITCHED OVER TI HAVING COUPLOE CONNECTION IN COUPLEVIEW PAGE
////  ForTwo
////
////  Created by Tao Shen on 2023-09-08.
////
//
//import SwiftUI
//
//struct ConnectionView: View {
//    @State private var coupleCode = ""
//    @State private var isEditing = false
//    @EnvironmentObject var viewModel: AuthViewModel
//
//    func copyToClipboard(_ text: String) {
//            let pasteboard = UIPasteboard.general
//            pasteboard.string = text
//    }
//
//    private func hideKeyboard() {
//    // Resign first responder to hide the keyboard
//        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//        isEditing = false
//    }
//
//    var body: some View {
//        ZStack() {
//            Image("newbg")
//                .resizable()
//                .ignoresSafeArea()
//                .onTapGesture {
//                    hideKeyboard()
//                }
//            GeometryReader { geometry in
//                VStack {
//                    Spacer()
//
//                    ZStack {
//                            Rectangle()
//                                .foregroundColor(Color(red: 0xe7 / 255, green: 0xda / 255, blue: 0xda / 255))
//                                .frame(width: geometry.size.width, height: geometry.size.height / 1.5)
//                                .cornerRadius(30)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 30)
//                                        .stroke(Color(red: 0xaf / 255, green: 0xaf / 255, blue: 0xaf / 255), lineWidth: 1)
//                                )
//                                .onTapGesture {
//                                    hideKeyboard()
//                                }
////                                .overlay(
////                                    Rectangle()
////                                        .cornerRadius(30)
////                                        .border(Color(red: 0xb2 / 255, green: 0xb2 / 255, blue: 0xb2 / 255))
////                                        .frame(width: geometry.size.width, height: geometry.size.height / 1.5)
////                                        .background(.clear)
////                                )
////                                .background(
////                                    Rectangle()
////                                        .fill(Color(red: 0xf8 / 255, green: 0xf8 / 255, blue: 0xf8 / 255))
////                                        .frame(width: geometry.size.width, height: geometry.size.height / 1.5)
////                                )
////                                .border(Color(red: 0xb2 / 255, green: 0xb2 / 255, blue: 0xb2 / 255))
//                            VStack {
//                                Text("Guide: Enter your partners code or wait for your partner to enter your code to connect your ForTwo profiles")
//                                    .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
//                                    .font(Font.custom("HermeneusOne-Regular", size: 20))
//                                    .multilineTextAlignment(.center)
//                                    .padding([.horizontal], 30)
//                                    .padding([.vertical], 10)
//                                Text("Couple code:")
//                                    .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
//                                    .font(Font.custom("HermeneusOne-Regular", size: 20))
//                                    .multilineTextAlignment(.center)
//                                    .padding(5)
//                                Button(action: {}) {
//                                    Text("a7YJjR3XYlhhrBTowiuptxxyIJn1")
//                                        .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
//                                        .font(Font.custom("HermeneusOne-Regular", size: 16))
//                                        .multilineTextAlignment(.center)
//                                        .padding(5)
//                                    //                                        .underline()
//                                        .underline(true, color: Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
//                                        .baselineOffset(5.0)
//                                        .onTapGesture {
//                                            copyToClipboard("a7YJjR3XYlhhrBTowiuptxxyIJn1")
//                                        }
//                                }
//                                TextField("Enter your partner's couple code", text: self.$coupleCode)
//                                  .padding()
//                                  .onTapGesture {
//                                      // Set isEditing to true when the TextField is tapped
//                                      isEditing = true
//                                  }
//                                  .font(Font.custom("HermeneusOne-Regular", size: 16))
//                                  .background(Color(UIColor.secondarySystemBackground))
//                                  .cornerRadius(10.0)
//                                  .autocorrectionDisabled()
//                                  .disableAutocorrection(true)
//                                  .textInputAutocapitalization(.none)
//                                  .overlay(
//                                      RoundedRectangle(cornerRadius: 10)
//                                          .stroke(Color.gray, lineWidth: 0.5)
//                                  )
//                                  .frame(width: geometry.size.width / 1.2)
//
//                                Button(action: {
//                                    viewModel.didAuthenticateUser = false
//                                    print("test")
//                                }) {
//                                  Text("Connect")
//                                    .font(Font.custom("HermeneusOne-Regular", size: 20))
//                                    .foregroundColor(.white)
//                                    .frame(width: geometry.size.width / 1.5, height: 50)
//            //                        .background(Color.pink)
//                                    .background(Color(red: 0xdc / 255, green: 0x6d / 255, blue: 0x71 / 255))
//                                    .cornerRadius(30.0)
//                                }
//                                .padding([.top], 5)
//                                .onTapGesture {
//                                    hideKeyboard()
//                                }
//                                .opacity((coupleCode.isEmpty) ? 0.5 : 1.0)
//                                .disabled(coupleCode.isEmpty)
//
////                                Spacer()  //spacer and maybe refresh if it does not refresh automatically?
//
//
//                            }
//
//                    }
////                    .border(Color(red: 0xb2 / 255, green: 0xb2 / 255, blue: 0xb2 / 255))
//
//                    Spacer()
//                }
//            }
//            .padding(30)
//        }
//    }
//}
//
//struct ConnectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        ConnectionView()
//    }
//}
