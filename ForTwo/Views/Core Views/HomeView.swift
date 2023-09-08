//
//  HomeView.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-08-30.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
    //                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                // Top hud bar? for now can just be a (HStack)
                HStack {
//                    Text("ForTwo")
//                        .font(Font.custom("ZapfinoExtraLT-One", size: 36))
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "bell")
                            .font(.system(size: 24))
                            .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                    }
                }
                .padding([.top], 10)
//                .padding([.bottom], 5)
                .padding([.horizontal], 17)
//                .border(.red)
                
                // People <3 People and together section (Hstack for the people <3 people, Vstack surrounding), button here to feed?
                VStack {
                    // XXX <3 XXX
                    HStack {
                        Spacer()
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
                    .padding([.top], 20)
//                    .padding
                    
                    // Together for...
                    HStack {
                        Spacer()
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
//                    .border(.blue)
//                    .padding([.horizontal], 20)
//                    .padding([.bottom], )
                    
                    // Button?
//                    HStack {
//                        Spacer()
                        GeometryReader { geometry in
                            let safeArea = geometry.safeAreaInsets
                            let safeAreaWidth = geometry.size.width - safeArea.leading - safeArea.trailing
                            let safeAreaHeight = geometry.size.height - safeArea.top - safeArea.bottom
                            Button(action: {}) {
                                Spacer()
                                Image("letter icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width / 7, height: geometry.size.height / 3.2)
//                                    .scaleEffect(0.27)
            //                        .padding(-15)
//                                    .scaleEffect(geometry.size.width / 1200)
                                    .overlay(
                                        Circle()
                                            .stroke(Color(red: 0xaf / 255, green: 0xaf / 255, blue: 0xaf / 255), lineWidth: 1)
                                            .frame(width: 220, height: geometry.size.height / 2)
                                    )
                                    .background(
                                        Circle()
                                            .fill(Color(red: 0xf8 / 255, green: 0xf8 / 255, blue: 0xf8 / 255))
                                            .frame(width: 220, height: geometry.size.height / 2) // height: 45?
                                    )
//                                    .border(.green)
                            }
//                            Text("Safe Area Width: \(safeAreaWidth), Height: \(safeAreaHeight)")
//                                          .padding()
//                            .offset(y: -50)
//                            .offset(y: -geometr)
                            .offset(y: -geometry.size.height / 3.5)
                        }
//                        .padding([.top], 30)
//                        .offset(y: -30)
//                        .border(.red)
//                    }
//                    .border(.red)
//                    .padding([.horizontal], 20)
                }
                //hrere
                .padding([.horizontal], 20)
//                .border(.blue)
                
                Spacer()
                // main section (ZStack, letter animation to get the question and the blurb saying good day and when next question is/if you have a question waiting
                ZStack {
                    // Carpet?
//                    Image("carpet")
//                        .resizable()
                    // Letter
//                    Image("letter")
//                        .resizable()
//                        .scaleEffect(0.65)
//                        .scaledToFit()
//                        .border(.red)
//                        .padding([.bottom], 100)
//                    LetterWaitingView()
                    
                    
                    Image("bwcarpet")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(1)
                        .offset(y: 115)
//                        .padding()
                    Image("character")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.95)
                    
//                    LetterWaitingView()
//                        .scaleEffect(0.9)
                    // Text blurb
//                    Spacer()
                    
                    
                }
//                .offset(y: 10)
                
                GeometryReader { geometry in
//                        Spacer()
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color(red: 0xe0 / 255, green: 0xdd / 255, blue: 0xd7 / 255))
//                            .foregroundColor(.red)
//                            .fram
                            .frame(width: geometry.size.width, height: geometry.size.height / 1.125)
                            .cornerRadius(20)
//                            .border()
                        if (true) {  //if did not get new question
                            Text("Nice to see you!\n\nA question is waiting for you  📪")
                                .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                .font(Font.custom("HermeneusOne-Regular", size: 20))
                                .multilineTextAlignment(.center)
                         }
                        else {
                            Text("Nice to see you!\n\nNew question available in...")
                                .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                .font(Font.custom("HermeneusOne-Regular", size: 20))
                                .multilineTextAlignment(.center)
                        }
                    }
                }
                .scaleEffect(0.9)
                .padding([.top], 55)
            }
            
            
        }
//        Text("homeview")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
