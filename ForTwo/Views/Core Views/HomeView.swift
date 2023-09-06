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
                    Text("ForTwo")
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
                    .padding([.horizontal], 20)
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
                    .padding([.horizontal], 20)
//                    .padding([.bottom], )
                    
                    // Button?
                }
//                .border(.blue)
                
                Spacer()
                // main section (ZStack, letter animation to get the question and the blurb saying good day and when next question is/if you have a question waiting
                ZStack {
                    // Carpet?
//                    Image("carpet")
//                        .resizable()
                    // Letter
                    Image("letter")
                        .resizable()
                        .scaleEffect(0.65)
                        .scaledToFit()
                        .border(.red)
                        .padding([.bottom], 100)
                    // Text blurb
//                    Spacer()
                    
                    
                }
                
                ZStack {
                    GeometryReader { geometry in
                        Rectangle()
                            .foregroundColor(Color.blue)
//                            .fram
                            .frame(height: 100)
                            .cornerRadius(10)
                    }
                    Text("text")
                        .foregroundColor(.white)
                }
                .border(.red)
                .padding(20)
                Spacer()
                
                
                
                //
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
