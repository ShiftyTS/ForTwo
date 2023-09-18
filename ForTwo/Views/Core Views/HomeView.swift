//
//  HomeView.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-08-30.
//

import SwiftUI

// Displays home tab
struct HomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser, let couple = viewModel.currentCouple {
            
            ZStack {
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    
                    // Notifications
                    HStack {
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "bell")
                                .font(.system(size: 24))
                                .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                        }
                    }
                    .padding([.top], 10)
                    .padding([.horizontal], 17)
                    
                    // Main tab content
                    VStack {
                        
                        // Displays current user's name first
                        if user.id == couple.uidOne {
                            HStack {
                                
                                Spacer()
                                
                                // Couple
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
                            .padding([.top], 20)
                        } else {
                            HStack {
                                
                                Spacer()
                                
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
                            .padding([.top], 20)
                        }
                        
                        // Number of days together
                        HStack {
                            
                            Spacer()
                            
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
                        
                            GeometryReader { geometry in
                                
                                // Fetches new question - refreshes daily
                                Button(action: {
                                    if let coupleId = viewModel.currentCouple?.id {
                                        viewModel.fetchNewQuestion(coupleId: coupleId)
                                        viewModel.fetchAllCoupleQuestions(coupleId: coupleId)
                                    } else {
                                        print("Failed to fetch")
                                    }
                                }) {
                                    
                                    Spacer()
                                    
                                    Image("letter icon")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: geometry.size.width / 7, height: geometry.size.height / 3.2)
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
                                }
                                .offset(y: -geometry.size.height / 3.5)
                            }
                    }
                    .padding([.horizontal], 20)
                    
                    Spacer()
                    
                    // Displays character and blurb of text
                    ZStack {
                        Image("bwcarpet")
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(1)
                            .offset(y: 115)
                        Image("character")
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(0.95)
                    }
                    
                    GeometryReader { geometry in
                        ZStack {
                            Rectangle()
                                .foregroundColor(Color(red: 0xe0 / 255, green: 0xdd / 255, blue: 0xd7 / 255))
                                .frame(width: geometry.size.width, height: geometry.size.height / 1.125)
                                .cornerRadius(20)
                            
                            // Displays different text based on if a new question is available or not
                            if (true) {
                                Text("Good day!\n\nA question is waiting for you  📪")
                                    .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                    .font(Font.custom("HermeneusOne-Regular", size: 20))
                                    .multilineTextAlignment(.center)
                             }
                            else {
                                Text("Good day!\n\nNew question coming soon  ⏳")
                                    .foregroundColor(Color(red: 0x44 / 255, green: 0x44 / 255, blue: 0x44 / 255))
                                    .font(Font.custom("HermeneusOne-Regular", size: 19))
                                    .multilineTextAlignment(.center)
                            }
                        }
                    }
                    .scaleEffect(0.9)
                    .padding([.top], 55)
                }
            }
        }
    }
}
