//
//  EditAnswerView.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-09-11.
//

import SwiftUI

// View for editing a user's question answer
struct EditAnswerView: View {
    
    @State var questionText: String
    @State var questionNum: String
    @State var responseOne: String
    @State var responseTwo: String
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
                                
                                // Exits question editing mode
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }) {
                                    HStack {
                                        Image("backicon2")
                                            .resizable()
                                            .scaledToFit()
                                            .scaleEffect(0.5)
                                    }
                                }
                                
                                Spacer()
                                
                                // Updates the appropriate user's question response in real-time
                                Button(action: {
                                    if let unwrappedQuestionNum = Int(questionNum) {
                                        if user.id == couple.uidOne {
                                            viewModel.updateResponse(newResponse: responseOne, mapNum: unwrappedQuestionNum, coupleId: couple.id ?? "", changeResponseOne: true)
                                        } else {
                                            viewModel.updateResponse(newResponse: responseTwo, mapNum: unwrappedQuestionNum, coupleId: couple.id ?? "", changeResponseOne: false)
                                        }
                                        
                                        viewModel.fetchCouple(coupleId: couple.id ?? "")
                                        presentationMode.wrappedValue.dismiss()
                                    }
                                }) {
                                    HStack {
                                        Image("checkicon")
                                            .resizable()
                                            .scaledToFit()
                                            .scaleEffect(0.5)
                                    }
                                }
                            }
                            .frame(width: geometry.size.width, height: geometry.size.height / 12)
                            
                            // Displays main question section
                            ScrollView {
                                VStack {
                                    VStack {
                                        
                                        // Question text
                                        HStack {
                                            Text(questionText)
                                                .font(Font.custom("HermeneusOne-Regular", size: 20))
                                                .frame(width: geometry.size.width * 0.7, alignment: .leading)
//                                                .border(.red)
                                        }
                                        .padding([.bottom], 5)

                                        Spacer()
                                        
                                        // Question details
                                        HStack {
                                            Text("Question #" + questionNum + "     Sept 16. 2023")
                                                .font(Font.custom("HermeneusOne-Regular", size: 16))
                                                .foregroundColor(Color(red: 0xa9 / 255, green: 0xa9 / 255, blue: 0xa9 / 255))
                                                .frame(width: geometry.size.width * 0.7, alignment: .leading)
                                        }
                                    }
                                    .frame(width: geometry.size.width * 0.85, alignment: .leading)
                                    
                                    Spacer()
                                    
                                    // Displays the current user's question response
                                    if user.id == couple.uidOne {
                                        VStack {
                                            
                                            Spacer()
                                            
                                            // Nickname
                                            Text(couple.nicknameOne)
                                                .font(Font.custom("HermeneusOne-Regular", size: 16))
                                                .frame(width: geometry.size.width * 0.85, alignment: .leading)
                                                .padding([.vertical], 4)

                                            // Response
                                            if let innerMap = questions[questionNum], let resOne = innerMap["responseOne"] {
                                                TextField("Enter your response", text: self.$responseOne, axis: .vertical)
                                                    .textFieldStyle(PlainTextFieldStyle())
                                                    .font(Font.custom("HermeneusOne-Regular", size: 16))
                                                    .foregroundColor(Color(red: 0x54 / 255, green: 0x54 / 255, blue: 0x54 / 255))
                                                    .frame(width: geometry.size.width * 0.85, alignment: .leading)
                                            }
                                        }
                                        .padding([.bottom], geometry.size.height / 40)
                                    } else {
                                        VStack {
                                            
                                            Spacer()
                                            
                                            // Nickname
                                            Text(couple.nicknameTwo)
                                                .font(Font.custom("HermeneusOne-Regular", size: 16))
                                                .frame(width: geometry.size.width * 0.85, alignment: .leading)
                                                .padding([.vertical], 4)
                                            
                                            // Response
                                            if let innerMap = questions[questionNum], let resTwo = innerMap["responseTwo"] {
                                                TextField("Enter your response", text: self.$responseTwo, axis: .vertical)
                                                    .font(Font.custom("HermeneusOne-Regular", size: 16))
                                                    .foregroundColor(Color(red: 0x54 / 255, green: 0x54 / 255, blue: 0x54 / 255))
                                                    .frame(width: geometry.size.width * 0.85, alignment: .leading)
                                            }
                                        }
                                    }
                                }
                            }
                            .frame(width: geometry.size.width * 0.85)
                            
                            HStack {

                            }
                            .frame(width: geometry.size.width, height: geometry.size.height / 12)
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    
                    // Displays header
                    ToolbarItem(placement: .principal) {
                        Text("ForTwo")
                            .font(Font.custom("ZapfinoExtraLT-One", size: 44))
                    }
                }
            }
        }
    }
}
