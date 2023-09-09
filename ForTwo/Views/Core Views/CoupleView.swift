//
//  CoupleView.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-08-30.
//

import SwiftUI

struct CoupleView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    func copyToClipboard(_ text: String) {
            let pasteboard = UIPasteboard.general
            pasteboard.string = text
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
        //                .scaledToFill()
                    .ignoresSafeArea()
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
                            Text("160")
                                .foregroundColor(Color(.black))
                                .font(Font.custom("ZapfinoExtraLT-One", size: 40))
                                .padding([.top], 7)
                            Text("days")
                                .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                .font(Font.custom("HermeneusOne-Regular", size: 17))
    //                            .padding([.bottom], 2)
                        }
                        
                        Image("characterbed")
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(0.65)
                            
                        
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
////                                VStack {
////                                    Text("Couple code:")
////                                        .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
////                                        .font(Font.custom("HermeneusOne-Regular", size: 20))
////                                        .multilineTextAlignment(.center)
////                                        .padding(5)
//////                                    Text("123456789abcdxe")
//////                                        .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
//////                                        .font(Font.custom("HermeneusOne-Regular", size: 20))
//////                                        .multilineTextAlignment(.center)
//////                                        .padding(5)
////////                                        .underline()
//////                                        .underline(true, color: Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
//////                                        .baselineOffset(5.0)
//////                                        .onTapGesture {
//////                                            copyToClipboard("123456789abcdxe")
//////                                        }
////                                    Button(action: {}) {
////                                        Text("123456789abcdxe")
////                                            .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
////                                            .font(Font.custom("HermeneusOne-Regular", size: 20))
////                                            .multilineTextAlignment(.center)
////                                            .padding(5)
////                                        //                                        .underline()
////                                            .underline(true, color: Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
////                                            .baselineOffset(5.0)
////                                            .onTapGesture {
////                                                copyToClipboard("123456789abcdxe")
////                                            }
////                                    }
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
                            
                            Button(action: {}) {
                                Text("Disconnect with partner 💔")
                                    .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                    .font(Font.custom("HermeneusOne-Regular", size: 17))
                            }
                            .padding(10)
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
}

struct CoupleView_Previews: PreviewProvider {
    static var previews: some View {
        CoupleView()
    }
}
