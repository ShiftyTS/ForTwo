//
//  QuestionAnswerView.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-09-11.
//

import SwiftUI

// View for viewing the couple's question answers
struct QuestionAnswerView: View {
    
    @State var questionText: String
    @State var questionNum: String

    @State private var isEditing = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    var body: some View {
        if let user = viewModel.currentUser, let couple = viewModel.currentCouple, let questions = viewModel.questions {
            NavigationView {
                GeometryReader { geometry in
                    ZStack {
                        Image("background")
                            .resizable()
                            .ignoresSafeArea()
                        VStack {
                            HStack {
                                
                                // Edit icon to edit the user's question response
                                NavigationLink {
                                    if let innerMap = questions[questionNum], let resOne = innerMap["responseOne"], let resTwo = innerMap["responseTwo"] {
                                        EditAnswerView(questionText: questionText, questionNum: questionNum, responseOne: resOne, responseTwo: resTwo)
                                            .navigationBarHidden(true)
                                    }
                                } label: {
                                    HStack {
                                        Image("pencilicon")
                                            .resizable()
                                            .scaledToFit()
                                            .scaleEffect(0.5)
                                    }
                                }

                                Spacer()
                                
                                // Exit the question
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }) {
                                    HStack {
                                        Image("xicon")
                                            .resizable()
                                            .scaledToFit()
                                            .scaleEffect(0.5)
                                    }
                                }
                            }
                            .frame(width: geometry.size.width, height: geometry.size.height / 12)
                            
                            // Displays the question details and the couple's responses
                            ScrollView {
                                VStack {
                                    VStack {
                                        
                                        // Question text
                                        HStack {
                                            Text(questionText)
                                                .font(Font.custom("HermeneusOne-Regular", size: 20))
                                                .frame(width: geometry.size.width * 0.7, alignment: .leading)
                                        }
                                        .padding([.bottom], 5)
                                        
                                        Spacer()
                                        
                                        // Question number
                                        HStack {
                                            Text("Question #" + questionNum + "     Sept 16. 2023")
                                                .font(Font.custom("HermeneusOne-Regular", size: 16))
                                                .foregroundColor(Color(red: 0xa9 / 255, green: 0xa9 / 255, blue: 0xa9 / 255))
                                                .frame(width: geometry.size.width * 0.7, alignment: .leading)
                                        }
                                    }
                                    .frame(width: geometry.size.width * 0.85, alignment: .leading)
                                    
                                    Spacer()
                                    
                                    // Display current user's response on top
                                    if user.id == couple.uidOne {
                                        
                                        // User one's response
                                        VStack {
                                            
                                            Spacer()
                                            
                                            // Nickname
                                            Text(couple.nicknameOne)
                                                .font(Font.custom("HermeneusOne-Regular", size: 16))
                                                .frame(width: geometry.size.width * 0.85, alignment: .leading)
                                                .padding([.vertical], 4)
                                            
                                            // Response
                                            if let innerMap = questions[questionNum], let resOne = innerMap["responseOne"] {
                                                Text(resOne)
                                                    .font(Font.custom("HermeneusOne-Regular", size: 16))
                                                    .foregroundColor(Color(red: 0x54 / 255, green: 0x54 / 255, blue: 0x54 / 255))
                                                    .frame(width: geometry.size.width * 0.85, alignment: .leading)
                                            }
                                        }
                                        .padding([.bottom], geometry.size.height / 40)
                                        
                                        // User two's response
                                        VStack {
                                            
                                            Spacer()
                                            
                                            // Nickname
                                            Text(couple.nicknameTwo)
                                                .font(Font.custom("HermeneusOne-Regular", size: 16))
                                                .frame(width: geometry.size.width * 0.85, alignment: .leading)
                                                .padding([.vertical], 4)
                                            
                                            // Response
                                            if let innerMap = questions[questionNum], let resTwo = innerMap["responseTwo"] {
                                                Text(resTwo)
                                                    .font(Font.custom("HermeneusOne-Regular", size: 16))
                                                    .foregroundColor(Color(red: 0x54 / 255, green: 0x54 / 255, blue: 0x54 / 255))
                                                    .frame(width: geometry.size.width * 0.85, alignment: .leading)
                                            }
                                        }
                                    } else {
                                        
                                        // User two's Response
                                        VStack {
                                            
                                            Spacer()
                                            
                                            // Nickname
                                            Text(couple.nicknameTwo)
                                                .font(Font.custom("HermeneusOne-Regular", size: 16))
                                                .frame(width: geometry.size.width * 0.85, alignment: .leading)
                                                .padding([.vertical], 4)
                                            
                                            // Response
                                            if let innerMap = questions[questionNum], let resTwo = innerMap["responseTwo"] {
                                                Text(resTwo)
                                                    .font(Font.custom("HermeneusOne-Regular", size: 16))
                                                    .foregroundColor(Color(red: 0x54 / 255, green: 0x54 / 255, blue: 0x54 / 255))
                                                    .frame(width: geometry.size.width * 0.85, alignment: .leading)
                                            }
                                        }
                                        .padding([.bottom], geometry.size.height / 40)
                                        
                                        // User one's response
                                        VStack {
                                            
                                            Spacer()
                                            
                                            // Nickname
                                            Text(couple.nicknameOne)
                                                .font(Font.custom("HermeneusOne-Regular", size: 16))
                                                .frame(width: geometry.size.width * 0.85, alignment: .leading)
                                                .padding([.vertical], 4)
                                            
                                            // Response
                                            if let innerMap = questions[questionNum], let resOne = innerMap["responseOne"] {
                                                Text(resOne)
                                                    .font(Font.custom("HermeneusOne-Regular", size: 16))
                                                    .foregroundColor(Color(red: 0x54 / 255, green: 0x54 / 255, blue: 0x54 / 255))
                                                    .frame(width: geometry.size.width * 0.85, alignment: .leading)
                                            }
                                        }
                                    }
                                }
                            }
                            .frame(width: geometry.size.width * 0.85)
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("ForTwo")
                            .font(Font.custom("ZapfinoExtraLT-One", size: 44))
                    }
                }
            }
        }
    }
}
