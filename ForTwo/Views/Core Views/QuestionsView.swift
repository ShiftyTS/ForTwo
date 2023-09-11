//
//  QuestionsView.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-08-30.
//

import SwiftUI

struct QuestionsView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State var questionCounter: Int = 1
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
        //                .scaledToFill()
                    .ignoresSafeArea()
                VStack{
                    ScrollView {
                        LazyVStack {
                            if let user = viewModel.currentUser, let couple = viewModel.currentCouple {
//                                ForEach(couple.questions, id: \.self)
                                //                            if var coupleQuestions = viewModel.currentCouple?.questions {
                                ForEach(couple.questions.reversed(), id: \.self) { question in
                                    if let text = question["questionText"] {
//                                        NavigationLink {
//                                            RegistrationView(isAuthenticated: .constant(false))
//                                                .navigationBarHidden(true)
//                                        } label: {
//                                                Text("Don't have an account? Sign Up")
//                                                .font(.headline)
//                                                .foregroundColor(.black)
//                            //                    .padding([.top], 100)
//                                        }
                                        NavigationLink {
                                            QuestionAnswerView()
                                                .navigationBarHidden(true)
                                        } label: {
                                            QuestionRowView(questionText: text, questionNum: question["questionNum"] ?? "")
                                        }
//                                        questionCounter += 1
                                    }
//                                    self.questionCounter += 1
                                }
                            
                                //                            ForEach(viewModel.)
                            }
                            
//                            ForEach(0 ... 20, id: \.self) { _ in
//                                NavigationLink {
////                                    QuestionRowView() // ?
//                                } label: {
//                                    QuestionRowView(questionText: "text", questionNum: questionCounter)
//                                }
//                            }
                        }
                    }
                }
            }
//            .navigationTitle(Text("List")
//                                .font(Font.custom("ZapfinoExtraLT-One", size: 32)))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("List")
                        .font(Font.custom("ZapfinoExtraLT-One", size: 44))
                }
            }
        }
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView()
            .environmentObject(AuthViewModel())
    }
}



// List of questions, each question is clickable and when clicked it shows the
// responses/if the parter has not responded and comment section if time

// Fetching the responses
