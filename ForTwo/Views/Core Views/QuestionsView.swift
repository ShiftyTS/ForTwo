//
//  QuestionsView.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-08-30.
//

import SwiftUI

struct QuestionsView: View {
//    init() {
//        // Customize the appearance of the navigation bar
//        let appearance = UINavigationBarAppearance()
//        if let backgroundImage = UIImage(named: "background") {
//            appearance.backgroundImage = backgroundImage
//        }
//        
//        UINavigationBar.appearance().standardAppearance = appearance
//        UINavigationBar.appearance().scrollEdgeAppearance = appearance
//    }
    
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
                            ForEach(0 ... 20, id: \.self) { _ in
                                NavigationLink {
//                                    QuestionRowView() // ?
                                } label: {
                                    QuestionRowView()
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("List")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView()
    }
}



// List of questions, each question is clickable and when clicked it shows the
// responses/if the parter has not responded and comment section if time

// Fetching the responses
