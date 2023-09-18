//
//  QuestionsView.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-08-30.
//

import SwiftUI
import Firebase

// Displays questions tab
struct QuestionsView: View {
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                VStack{
                    ScrollView {
                        LazyVStack {
                            if let user = viewModel.currentUser, let couple = viewModel.currentCouple, let questions = viewModel.questions {
                                
                                // Iterates through and displays all of the given couple's questios
                                ForEach(questions.keys.sorted{
                                    $0.compare($1, options: .numeric) == .orderedDescending
                                }, id: \.self) { questionKey in
                                    if let questionValue = questions[questionKey], let text = questionValue["questionText"], let questionNum = questionValue["questionNum"] {

                                        // Displays individual question
                                        NavigationLink {
                                            QuestionAnswerView(questionText: text, questionNum: questionNum)
                                                .navigationBarHidden(true)
                                        } label: {
                                            QuestionRowView(questionText: text, questionNum: questionNum)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    
                    // Header
                    Text("List")
                        .font(Font.custom("ZapfinoExtraLT-One", size: 44))
                }
            }
        }
    }
}
